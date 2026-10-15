#!/usr/bin/env python3
"""The sources of PDFium's library targets, read from its BUILD.gn files.

PDFium's GN files keep their source lists as plain literals under a few
conditions: the platform, XFA, V8, Skia, the allocator. This evaluates
just that much of GN, no imports, no templates, no function calls, and
prints the sources of every source_set, static_library and component that
is not a test, relative to the tree's root. A condition over a variable
not listed here is an error, so a new upstream option is noticed.

    gn_sources.py ROOT [VAR=VALUE...] BUILD.gn...
"""
import os
import re
import sys

VARS = {
    "pdf_enable_xfa": False,
    "pdf_enable_xfa_bmp": False,
    "pdf_enable_xfa_gif": False,
    "pdf_enable_xfa_png": False,
    "pdf_enable_xfa_tiff": False,
    "pdf_enable_v8": False,
    "pdf_use_skia": False,
    "pdf_use_partition_alloc": False,
    "pdf_enable_rust_png": False,
    "pdf_enable_fontations": False,
    "pdf_bundle_freetype": True,
    "pdf_is_complete_lib": True,
    "pdf_is_standalone": True,
    "pdf_enable_click_logging": False,
    "pdf_skia_font_manager_target": "",
    "use_system_freetype": False,
    "use_system_libjpeg": True,
    "use_libjpeg_turbo": True,
    "use_system_zlib": True,
    "use_system_lcms2": False,
    "use_system_libopenjpeg2": False,
    "use_system_libpng": False,
    "use_system_libtiff": False,
    "enable_callgrind": False,
    "build_with_chromium": False,
    "is_component_build": False,
    "is_clang": True,
    "is_win": False,
    "is_apple": False,
    "is_mac": False,
    "is_ios": False,
    "is_android": False,
    "is_linux": True,
    "is_chromeos": False,
    "is_fuchsia": False,
    "is_posix": True,
    "is_debug": False,
    "is_asan": False,
    "is_msan": False,
    "is_ubsan": False,
    "is_official_build": False,
    "current_cpu": "x64",
    "target_cpu": "x64",
    "host_cpu": "x64",
    "current_os": "linux",
    "target_os": "linux",
}

LIBRARY_KINDS = {"source_set", "static_library", "component"}
TEST_WORDS = ("test", "fuzz", "diff", "sample")

TOKEN = re.compile(
    r'\s+|#[^\n]*|"(?:[^"\\]|\\.)*"|&&|\|\||==|!=|\+=|-=|[A-Za-z_][A-Za-z_0-9]*|[-+]?[0-9]+|[{}()\[\],=!.]'
)


def tokenize(text):
    out = []
    at = 0
    while at < len(text):
        m = TOKEN.match(text, at)
        if not m:
            raise SyntaxError(f"cannot tokenize at: {text[at:at + 40]!r}")
        at = m.end()
        tok = m.group()
        if tok.isspace() or tok.startswith("#"):
            continue
        out.append(tok)
    return out


class Parser:
    def __init__(self, tokens, variables, directory, root):
        self.tokens = tokens
        self.at = 0
        self.vars = variables
        self.directory = directory
        self.root = root
        self.targets = {}

    def peek(self, offset=0):
        i = self.at + offset
        return self.tokens[i] if i < len(self.tokens) else None

    def take(self, expected=None):
        tok = self.peek()
        if expected is not None and tok != expected:
            raise SyntaxError(f"expected {expected!r}, got {tok!r} near {self.tokens[self.at:self.at + 8]}")
        self.at += 1
        return tok

    # ---- expressions, only as far as the conditions need ----

    def value(self):
        tok = self.take()
        if tok == "!":
            return not self.value()
        if tok == "(":
            v = self.expression()
            self.take(")")
            return v
        if tok.startswith('"'):
            return tok[1:-1]
        if tok == "true":
            return True
        if tok == "false":
            return False
        if re.fullmatch(r"[-+]?[0-9]+", tok):
            return int(tok)
        if tok == "defined":
            self.take("(")
            name = self.take()
            self.take(")")
            return name in self.vars
        if tok not in self.vars:
            raise KeyError(f"unknown variable {tok} in {self.directory}/BUILD.gn")
        return self.vars[tok]

    def comparison(self):
        left = self.value()
        while self.peek() in ("==", "!="):
            op = self.take()
            right = self.value()
            left = (left == right) if op == "==" else (left != right)
        return left

    def conjunction(self):
        left = self.comparison()
        while self.peek() == "&&":
            self.take()
            right = self.comparison()
            left = left and right
        return left

    def expression(self):
        left = self.conjunction()
        while self.peek() == "||":
            self.take()
            right = self.conjunction()
            left = left or right
        return left

    # ---- values of assignments, skipped or collected ----

    def skip_value(self):
        """Steps over an assignment's right side: a list, a string, an
        expression; the lists of sources are collected by the caller."""
        tok = self.take()
        if tok == "[":
            depth = 1
            while depth:
                tok = self.take()
                if tok == "[":
                    depth += 1
                elif tok == "]":
                    depth -= 1
            return
        if tok == "(":
            depth = 1
            while depth:
                tok = self.take()
                if tok == "(":
                    depth += 1
                elif tok == ")":
                    depth -= 1
        # a bare value, maybe followed by operators and more values
        while self.peek() in ("+", "-", "==", "!=", "&&", "||", "."):
            self.take()
            if self.peek() in ("[", "("):
                self.skip_value()
            else:
                self.take()

    def string_list(self):
        self.take("[")
        items = []
        while self.peek() != "]":
            tok = self.take()
            if tok.startswith('"'):
                items.append(tok[1:-1])
            elif tok == ",":
                continue
            else:
                raise SyntaxError(f"a non-string in a source list: {tok!r} in {self.directory}")
        self.take("]")
        return items

    def resolve(self, path):
        if path.startswith("//"):
            return os.path.normpath(path[2:])
        return os.path.normpath(os.path.join(self.directory, path))

    # ---- statements ----

    def block(self, live, sources):
        """A { ... } body: assignments and ifs. sources is the list the
        body adds to when live, or None outside a target."""
        self.take("{")
        while self.peek() != "}":
            self.statement(live, sources)
        self.take("}")

    def statement(self, live, sources):
        tok = self.peek()
        if tok == "if":
            self.take()
            self.take("(")
            cond = self.expression()
            self.take(")")
            self.block(live and cond, sources)
            taken = cond
            while self.peek() == "else":
                self.take()
                if self.peek() == "if":
                    self.take()
                    self.take("(")
                    cond = self.expression()
                    self.take(")")
                    self.block(live and not taken and cond, sources)
                    taken = taken or cond
                else:
                    self.block(live and not taken, sources)
            return
        name = self.take()
        if self.peek() == "(":
            # a call: import("..."), assert(...), a template, or a target
            # kind("name") { body }; only a library target's body is read
            self.take("(")
            inner = []
            depth = 1
            while depth:
                tok = self.take()
                if tok == "(":
                    depth += 1
                elif tok == ")":
                    depth -= 1
                if depth:
                    inner.append(tok)
            target = inner[0][1:-1] if len(inner) == 1 and inner[0].startswith('"') else None
            is_library = name in LIBRARY_KINDS and target is not None and not any(w in target for w in TEST_WORDS)
            if self.peek() == "{":
                collected = [] if is_library else None
                self.block(live and is_library, collected)
                if is_library and live:
                    self.targets[target] = collected
            return
        op = self.take()
        if op not in ("=", "+=", "-="):
            raise SyntaxError(f"unexpected {op!r} after {name} in {self.directory}")
        if name == "sources" and sources is not None:
            items = [self.resolve(p) for p in self.string_list()]
            if not live:
                return
            if op == "-=":
                for item in items:
                    if item in sources:
                        sources.remove(item)
            else:
                if op == "=":
                    sources.clear()
                sources.extend(items)
            return
        self.skip_value()

    def file(self):
        while self.peek() is not None:
            self.statement(True, None)
        return self.targets


def main():
    root = os.path.abspath(sys.argv[1])
    files = []
    variables = dict(VARS)
    for arg in sys.argv[2:]:
        if "=" in arg and not arg.endswith(".gn"):
            key, value = arg.split("=", 1)
            variables[key] = {"true": True, "false": False}.get(value, value)
        else:
            files.append(arg)
    seen = set()
    for path in files:
        full = os.path.abspath(path)
        directory = os.path.relpath(os.path.dirname(full), root)
        if directory == ".":
            directory = ""
        with open(full) as f:
            tokens = tokenize(f.read())
        targets = Parser(tokens, variables, directory, root).file()
        for target, sources in targets.items():
            for source in sources:
                if source.endswith((".c", ".cc", ".cpp")) and source not in seen:
                    seen.add(source)
                    print(source)


if __name__ == "__main__":
    main()

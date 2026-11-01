#!/usr/bin/env python3

"""Build Bazel cc targets without Bazel.

BUILD and .bzl files are Starlark, which is a subset of Python, so they are
executed as Python against stub rules that only record their attributes.
The closure of the requested targets is then turned into a build.ninja that
compiles every source with its own target's flags, an install.sh that lays
out the library and its headers, and an env file for the package.

Only the native C++ rules and plain macros are understood. Custom rule()
implementations, providers, toolchains and repository rules are not: a
target that needs them fails with its label, so a recipe can see what to
patch. External repositories are never built; --repo names those that the
build environment already provides, and deps on them are dropped.
"""

import os
import re
import sys
import shlex
import argparse


DEFAULT = '//conditions:default'
CXX_EXT = ('.cc', '.cpp', '.cxx', '.c++', '.C')
C_EXT = ('.c',)
ASM_EXT = ('.S', '.s')
HDR_EXT = ('.h', '.hh', '.hpp', '.hxx', '.inc', '.inl', '.ipp', '.def')


class Error(Exception):
    pass


def fail(*args, **kwargs):
    raise Error(' '.join(str(x) for x in args))


class Select:
    """select() values, kept unresolved until a target is analyzed.

    Concatenation with plain values is preserved in order, as Starlark does.
    """

    def __init__(self, parts):
        self.parts = parts

    def __add__(self, other):
        return Select(self.parts + (other.parts if isinstance(other, Select) else [other]))

    def __radd__(self, other):
        return Select([other] + self.parts)

    def __or__(self, other):
        return self.__add__(other)


class Struct:
    def __init__(self, **kwargs):
        self.__dict__.update(kwargs)


def starlark_type(v):
    if isinstance(v, bool):
        return 'bool'
    if isinstance(v, int):
        return 'int'
    if isinstance(v, str):
        return 'string'
    if isinstance(v, (list, Select)):
        return 'list' if isinstance(v, list) else 'select'
    if isinstance(v, tuple):
        return 'tuple'
    if isinstance(v, dict):
        return 'dict'
    if v is None:
        return 'NoneType'
    if callable(v):
        return 'function'
    if isinstance(v, Struct):
        return 'struct'
    return type(v).__name__


def glob_regex(pattern):
    out = ''
    i = 0

    while i < len(pattern):
        if pattern.startswith('**/', i):
            out += '(?:.*/)?'
            i += 3
        elif pattern.startswith('**', i):
            out += '.*'
            i += 2
        elif pattern[i] == '*':
            out += '[^/]*'
            i += 1
        elif pattern[i] == '?':
            out += '[^/]'
            i += 1
        else:
            out += re.escape(pattern[i])
            i += 1

    return re.compile(out + r'\Z')


class Target:
    def __init__(self, kind, pkg, name, attrs):
        self.kind = kind
        self.pkg = pkg
        self.name = name
        self.attrs = attrs

    @property
    def label(self):
        return f'//{self.pkg}:{self.name}'


class Workspace:
    def __init__(self, root, args):
        self.root = os.path.abspath(root)
        self.args = args
        self.targets = {}
        self.packages = {}
        self.modules = {}
        self.warned = set()

    # labels

    def split(self, label):
        if label.startswith('@@'):
            label = label[1:]

        repo = None

        if label.startswith('@'):
            repo, sep, rest = label[1:].partition('//')

            if not sep:
                return repo, '', repo

            label = '//' + rest

        if not label.startswith('//'):
            raise Error(f'not an absolute label: {label}')

        pkg, sep, name = label[2:].partition(':')

        return repo, pkg, name if sep else os.path.basename(pkg)

    def canon(self, pkg, label):
        """Absolute form of a label written inside package pkg."""
        if label.startswith('@') or label.startswith('//'):
            repo, p, n = self.split(label)

            if repo and repo not in self.args.main_repo:
                return f'@{repo}//{p}:{n}'

            return f'//{p}:{n}'

        if label.startswith(':'):
            label = label[1:]

        return f'//{pkg}:{label}'

    def external(self, label):
        return label.startswith('@')

    # evaluation

    def find_build(self, pkg):
        for name in ('BUILD.bazel', 'BUILD'):
            path = os.path.join(self.root, pkg, name)

            if os.path.isfile(path):
                return path

    def is_package(self, rel):
        return any(os.path.isfile(os.path.join(self.root, rel, n)) for n in ('BUILD', 'BUILD.bazel'))

    def glob(self, pkg, include, exclude=(), exclude_directories=1, allow_empty=True):
        base = os.path.join(self.root, pkg)
        inc = [glob_regex(p) for p in include]
        exc = [glob_regex(p) for p in exclude]
        res = []

        for top, dirs, files in os.walk(base):
            rel_top = os.path.relpath(top, base)

            if rel_top == '.':
                rel_top = ''
            else:
                rel_top += '/'

            # globs never cross into a subpackage
            dirs[:] = sorted(d for d in dirs if not self.is_package(os.path.join(pkg, rel_top + d)))

            names = list(files)

            if not exclude_directories:
                names += dirs

            for f in names:
                rel = rel_top + f

                if any(r.match(rel) for r in inc) and not any(r.match(rel) for r in exc):
                    res.append(rel)

        if not res and not allow_empty:
            raise Error(f'//{pkg}: glob({include}) matched nothing')

        return sorted(res)

    def rule(self, kind, pkg):
        def record(name, **attrs):
            label = f'//{pkg}:{name}'

            if label in self.targets:
                raise Error(f'{label} defined twice')

            self.targets[label] = Target(kind, pkg, name, attrs)

        record.__name__ = kind

        return record

    def environment(self, pkg):
        def noop(*args, **kwargs):
            pass

        def load(label, *symbols, **aliases):
            module = self.load_module(pkg, label, list(symbols) + list(aliases.values()))
            caller = sys._getframe(1).f_globals

            for s in symbols:
                caller[s] = module[s]

            for alias, s in aliases.items():
                caller[alias] = module[s]

        native = Struct()
        env = {}

        for kind in ('cc_library', 'cc_binary', 'cc_test', 'cc_import', 'config_setting', 'alias',
                     'filegroup', 'genrule', 'test_suite', 'sh_binary', 'sh_test', 'py_binary',
                     'py_library', 'py_test', 'proto_library', 'cc_proto_library', 'constraint_setting',
                     'constraint_value', 'platform', 'toolchain'):
            env[kind] = self.rule(kind, pkg)
            setattr(native, kind, env[kind])

        for name in ('package', 'licenses', 'exports_files', 'package_group', 'workspace'):
            env[name] = noop
            setattr(native, name, noop)

        def glob(include, exclude=[], exclude_directories=1, allow_empty=True):
            return self.glob(pkg, include, exclude, exclude_directories, allow_empty)

        def existing_rules():
            return {t.name: dict(t.attrs, kind=t.kind, name=t.name)
                    for t in self.targets.values() if t.pkg == pkg}

        def existing_rule(name):
            return existing_rules().get(name)

        native.glob = glob
        native.package_name = lambda: pkg
        native.repository_name = lambda: '@'
        native.module_name = lambda: None
        native.existing_rules = existing_rules
        native.existing_rule = existing_rule

        env.update({
            'load': load,
            'glob': glob,
            'select': lambda d, no_match_error='': Select([d]),
            'native': native,
            'struct': Struct,
            'fail': fail,
            'print': lambda *a, **kw: print(*a, file=sys.stderr),
            'type': starlark_type,
            'Label': lambda s: self.canon(pkg, s),
            'package_name': lambda: pkg,
            'repository_name': lambda: '@',
            'depset': lambda direct=[], transitive=[], **kw: list(direct) + [x for t in transitive for x in t],
            'provider': lambda *a, **kw: Struct,
            'rule': self.opaque_rule_factory(pkg),
        })

        return env

    def opaque_rule_factory(self, pkg):
        def rule(implementation=None, **kwargs):
            return self.rule('rule:' + getattr(implementation, '__name__', '?'), pkg)

        return rule

    def execute(self, path, env):
        with open(path) as f:
            code = compile(f.read(), os.path.relpath(path, self.root), 'exec')

        exec(code, env)

        return env

    def load_module(self, pkg, label, symbols):
        full = self.canon(pkg, label)

        if self.external(full):
            repo = self.split(full)[0]
            shim = SHIMS.get((repo, full.partition('//')[2])) or SHIMS.get((repo, '*'))

            if shim:
                return shim(self, pkg)

            # unknown external macros: their targets are recorded opaquely and
            # fail only if a requested closure reaches one
            self.warn(f'{full}: unknown external module, {", ".join(symbols)} recorded opaquely')

            return {s: self.rule(f'{full}%{s}', pkg) for s in symbols}

        _, p, n = self.split(full)
        path = os.path.join(self.root, p, n)

        if path not in self.modules:
            # a module's own loads resolve against its package, but the rules it
            # instantiates belong to the BUILD file being evaluated: Bazel macros
            # use native.package_name() of the caller
            self.modules[path] = ModuleProxy(self, p, path)

        return self.modules[path].bind(pkg)

    def load_package(self, pkg):
        if pkg in self.packages:
            return

        path = self.find_build(pkg)

        if not path:
            raise Error(f'no BUILD file in //{pkg}')

        self.packages[pkg] = True
        self.execute(path, self.environment(pkg))

    def target(self, label):
        if self.external(label):
            raise Error(f'{label}: external target needed but not provided (pass --repo)')

        repo, pkg, name = self.split(label)
        self.load_package(pkg)

        try:
            return self.targets[f'//{pkg}:{name}']
        except KeyError:
            raise Error(f'no target {label}')

    def warn(self, msg):
        if msg not in self.warned:
            self.warned.add(msg)
            print(f'bazel_lite: {msg}', file=sys.stderr)


class ModuleProxy:
    """A .bzl module, re-evaluated per calling package.

    Macros call native.cc_library() and friends, and those must land in the
    package that calls the macro, not the one that holds the .bzl file.
    Evaluating the module once per caller keeps that simple and correct.
    """

    def __init__(self, ws, pkg, path):
        self.ws = ws
        self.pkg = pkg
        self.path = path
        self.bound = {}

    def bind(self, caller):
        if caller not in self.bound:
            env = self.ws.environment(caller)
            # loads inside the module resolve against the module's package
            env['load'] = self.loader(env)
            self.bound[caller] = self.ws.execute(self.path, env)

        return self.bound[caller]

    def loader(self, env):
        def load(label, *symbols, **aliases):
            label = self.ws.canon(self.pkg, label) if not label.startswith(('@', '//')) else label
            module = self.ws.load_module(env['package_name'](), label, list(symbols) + list(aliases.values()))

            for s in symbols:
                env[s] = module[s]

            for alias, s in aliases.items():
                env[alias] = module[s]

        return load


def rules_cc(ws, pkg):
    env = ws.environment(pkg)

    return {k: env[k] for k in ('cc_library', 'cc_binary', 'cc_test', 'cc_import', 'cc_proto_library')}


def skylib_selects(ws, pkg):
    def with_or(d, no_match_error=''):
        out = {}

        for k, v in d.items():
            for kk in (k if isinstance(k, tuple) else (k,)):
                out[kk] = v

        return Select([out])

    def config_setting_group(name, match_any=None, match_all=None, **kwargs):
        ws.rule('config_setting_group', pkg)(name=name, match_any=match_any or [], match_all=match_all or [])

    return {'selects': Struct(with_or=with_or, with_or_dict=lambda d: d, config_setting_group=config_setting_group)}


def skylib_paths(ws, pkg):
    return {'paths': Struct(
        join=lambda *p: os.path.join(*p),
        basename=os.path.basename,
        dirname=os.path.dirname,
        normalize=os.path.normpath,
        relativize=lambda p, start: os.path.relpath(p, start),
        split_extension=os.path.splitext,
        is_absolute=os.path.isabs,
    )}


def builtin_rules(*names):
    def shim(ws, pkg):
        env = ws.environment(pkg)

        return {n: env[n] for n in names}

    return shim


SHIMS = {
    ('rules_cc', '*'): rules_cc,
    ('bazel_skylib', 'lib:selects.bzl'): skylib_selects,
    ('bazel_skylib', 'lib:paths.bzl'): skylib_paths,
    ('com_google_protobuf', '*'): builtin_rules('proto_library', 'cc_proto_library'),
    ('protobuf', '*'): builtin_rules('proto_library', 'cc_proto_library'),
    ('rules_proto', '*'): builtin_rules('proto_library'),
}


class Analysis:
    """Configured view of the workspace: selects resolved, closure computed."""

    def __init__(self, ws, args):
        self.ws = ws
        self.args = args
        self.platform = set(ws.canon('', x) for x in args.platform)
        self.flags = dict(x.split('=', 1) for x in args.flag)
        self.defines = dict(x.split('=', 1) if '=' in x else (x, '') for x in args.define)
        self.forced = {}

        for x in args.config:
            label, _, value = x.partition('=')
            self.forced[ws.canon('', label)] = value not in ('0', 'false', 'False')

        self.provided = set(args.repo)
        self.settings = {}

    def matches(self, label):
        if label in self.forced:
            return self.forced[label]

        if label in self.platform:
            return True

        if label in self.settings:
            return self.settings[label]

        if self.ws.external(label):
            # constraint values of other platforms, settings of external repos
            self.ws.warn(f'{label}: unknown condition, taken as false')
            return False

        t = self.ws.target(label)
        self.settings[label] = False

        if t.kind == 'config_setting':
            self.settings[label] = self.config_setting(t)
        elif t.kind == 'config_setting_group':
            any_ = [self.matches(self.ws.canon(t.pkg, x)) for x in t.attrs['match_any']]
            all_ = [self.matches(self.ws.canon(t.pkg, x)) for x in t.attrs['match_all']]
            self.settings[label] = (any(any_) if any_ else True) and all(all_)
        elif t.kind == 'constraint_value':
            self.settings[label] = label in self.platform
        elif t.kind == 'alias':
            self.settings[label] = self.matches(self.ws.canon(t.pkg, self.resolve(t, t.attrs['actual'])))
        else:
            raise Error(f'{label} is a {t.kind}, not a condition')

        return self.settings[label]

    def config_setting(self, t):
        a = t.attrs

        for c in a.get('constraint_values', []):
            if not self.matches(self.ws.canon(t.pkg, c)):
                return False

        for k, v in a.get('values', {}).items():
            if k == 'define':
                dk, _, dv = v.partition('=')

                if self.defines.get(dk) != dv:
                    return False
            elif self.flags.get(k) != str(v):
                if k not in self.flags:
                    self.ws.warn(f'{t.label}: --{k} is not set, setting taken as false')

                return False

        for k, v in a.get('define_values', {}).items():
            if self.defines.get(k) != v:
                return False

        for k, v in a.get('flag_values', {}).items():
            key = self.ws.canon(t.pkg, k)

            if self.flags.get(key, self.flags.get(k)) != str(v):
                if key not in self.flags and k not in self.flags:
                    self.ws.warn(f'{t.label}: flag {key} is not set, setting taken as false')

                return False

        return True

    def resolve(self, t, v):
        if not isinstance(v, Select):
            return v

        out = None

        for part in v.parts:
            if isinstance(part, dict):
                chosen = None
                found = False

                for k, val in part.items():
                    if k != DEFAULT and self.matches(self.ws.canon(t.pkg, k)):
                        chosen, found = val, True
                        break

                if not found:
                    if DEFAULT not in part:
                        raise Error(f'{t.label}: no select() branch matches {sorted(part)}')

                    chosen = part[DEFAULT]

                part = chosen

            out = part if out is None else out + part

        return out

    def attr(self, t, name, default=None):
        return self.resolve(t, t.attrs.get(name, default if default is not None else []))

    def actual(self, label):
        """Follow aliases to a real target."""
        seen = set()

        while not self.ws.external(label):
            t = self.ws.target(label)

            if t.kind != 'alias':
                return label

            if label in seen:
                raise Error(f'alias cycle at {label}')

            seen.add(label)
            label = self.ws.canon(t.pkg, self.attr(t, 'actual', ''))

        return label

    def provided_repo(self, label):
        return self.ws.external(label) and self.ws.split(label)[0] in self.provided

    def files(self, t, attr):
        """Workspace-relative files of a label-list attribute."""
        out = []

        for x in self.attr(t, attr):
            label = self.ws.canon(t.pkg, x)

            if self.provided_repo(label):
                continue

            if self.ws.external(label):
                raise Error(f'{t.label}: {attr} uses {label} from an external repository not provided')

            repo, pkg, name = self.ws.split(label)
            self.ws.load_package(pkg)

            if f'//{pkg}:{name}' not in self.ws.targets:
                if not os.path.isfile(os.path.join(self.ws.root, pkg, name)):
                    raise Error(f'{t.label}: {attr} names {label}, neither a target nor a file')

                out.append(os.path.join(pkg, name))
                continue

            ref = self.ws.target(self.actual(label))

            if ref.kind == 'filegroup':
                out += self.files(ref, 'srcs')
            elif ref.kind in ('cc_library', 'cc_import'):
                raise Error(f'{t.label}: {attr} refers to a library {ref.label}')
            else:
                raise Error(f'{t.label}: {attr} uses {ref.label}, a {ref.kind}; generated files are not supported')

        return out

    def deps(self, t, attr='deps'):
        out = []

        for x in self.attr(t, attr):
            label = self.ws.canon(t.pkg, x)

            if self.provided_repo(label):
                continue

            out.append(self.actual(label))

        return out

    def closure(self, tops):
        order = []
        seen = set()

        def visit(label, path):
            if label in seen:
                return

            seen.add(label)
            t = self.ws.target(label)

            if t.kind not in ('cc_library', 'cc_binary'):
                raise Error(f'{" -> ".join(path + [label])}: {t.kind} is not supported')

            for d in self.deps(t) + self.deps(t, 'implementation_deps'):
                visit(d, path + [label])

            order.append(t)

        for top in tops:
            visit(self.actual(self.ws.canon('', top)), [])

        return order


class Compile:
    """Compile context a library exports to whatever depends on it."""

    def __init__(self):
        self.defines = []
        self.isystem = []
        self.iquote_virtual = []
        self.linkopts = []

    def merge(self, other):
        for k in ('defines', 'isystem', 'iquote_virtual', 'linkopts'):
            mine = getattr(self, k)

            for x in getattr(other, k):
                if x not in mine:
                    mine.append(x)


def ninja_escape(s):
    return s.replace('$', '$$').replace('\n', '$\n')


def sh(args):
    return ' '.join(shlex.quote(a) for a in args)


class Generator:
    def __init__(self, ana, args):
        self.ana = ana
        self.ws = ana.ws
        self.args = args
        self.out = os.path.abspath(args.out)
        self.exported = {}
        self.virtual = {}

    def virtual_headers(self, t):
        """Headers under strip_include_prefix/include_prefix, as Bazel's _virtual_includes."""
        strip = self.ana.attr(t, 'strip_include_prefix', '')
        prefix = self.ana.attr(t, 'include_prefix', '')

        if not strip and not prefix:
            return None, []

        if strip.startswith('/'):
            base = strip.lstrip('/')
        else:
            base = os.path.normpath(os.path.join(t.pkg, strip)) if strip else t.pkg

        root = os.path.join(self.out, '_virtual_includes', t.pkg, t.name)
        out = []

        for h in self.ana.files(t, 'hdrs') + self.ana.files(t, 'textual_hdrs'):
            rel = os.path.relpath(h, base)

            if rel.startswith('..'):
                raise Error(f'{t.label}: {h} is outside strip_include_prefix {base}')

            out.append((h, os.path.join(prefix, rel)))

        return root, out

    def export(self, t):
        if t.label in self.exported:
            return self.exported[t.label]

        ctx = Compile()

        for d in self.ana.deps(t):
            ctx.merge(self.export(self.ws.target(d)))

        for d in self.ana.attr(t, 'defines'):
            if d not in ctx.defines:
                ctx.defines.append(d)

        for inc in self.ana.attr(t, 'includes'):
            path = os.path.normpath(os.path.join(t.pkg, inc))

            if path not in ctx.isystem:
                ctx.isystem.append(path)

        root, headers = self.virtual_headers(t)

        if root:
            self.virtual[t.label] = (root, headers)
            ctx.iquote_virtual.append(root)

        for x in self.ana.attr(t, 'linkopts'):
            if x not in ctx.linkopts:
                ctx.linkopts.append(x)

        self.exported[t.label] = ctx

        return ctx

    def flags(self, t, src):
        ctx = Compile()
        ctx.merge(self.export(t))

        for d in self.ana.deps(t, 'implementation_deps'):
            ctx.merge(self.export(self.ws.target(d)))

        is_cxx = src.endswith(CXX_EXT)
        is_c = src.endswith(C_EXT)

        f = list(self.args.copt)

        if is_cxx:
            f += self.args.cxxopt
        elif is_c:
            f += self.args.conlyopt

        f += ['-iquote', '.', '-iquote', os.path.join(self.out, 'bin')]

        for v in ctx.iquote_virtual:
            f += ['-I', v]

        for i in ctx.isystem:
            f += ['-isystem', i]

        f += ['-D' + d for d in ctx.defines]
        f += ['-D' + d for d in self.ana.attr(t, 'local_defines')]
        f += self.ana.attr(t, 'copts')

        if is_cxx:
            f += self.ana.attr(t, 'cxxopts')
        elif is_c:
            f += self.ana.attr(t, 'conlyopts')

        return f

    def generate(self, tops):
        targets = self.ana.closure(tops)

        for t in targets:
            self.export(t)

        lines = [
            '# generated by bazel_lite, do not edit',
            f'root = {ninja_escape(self.ws.root)}',
            f'cc = {ninja_escape(self.args.cc)}',
            f'cxx = {ninja_escape(self.args.cxx)}',
            f'ar = {ninja_escape(self.args.ar)}',
            '',
            'rule cc',
            '  command = cd $root && $cc $flags -c $src -o $out',
            '  description = CC $src',
            'rule cxx',
            '  command = cd $root && $cxx $flags -c $src -o $out',
            '  description = CXX $src',
            'rule ar',
            '  command = rm -f $out && $ar qcs $out $in',
            '  description = AR $out',
            'rule link',
            '  command = $cxx -o $out $in $linkopts',
            '  description = LINK $out',
            'rule run',
            '  command = sh $in',
            '  description = RUN $in',
            '',
        ]

        libs = []
        forced = []
        binaries = []
        dirs = {os.path.join(self.out, 'alwayslink'), os.path.join(self.out, 'bin')}

        for t in targets:
            objs = []

            for src in self.ana.files(t, 'srcs'):
                if src.endswith(HDR_EXT):
                    continue

                if src.endswith(CXX_EXT):
                    rule = 'cxx'
                elif src.endswith(C_EXT + ASM_EXT):
                    rule = 'cc'
                elif src.endswith(('.a', '.lo', '.o', '.so')):
                    raise Error(f'{t.label}: prebuilt {src} is not supported')
                else:
                    raise Error(f'{t.label}: do not know how to compile {src}')

                obj = os.path.join(self.out, '_objs', t.pkg, t.name, src + '.o')
                dirs.add(os.path.dirname(obj))
                lines.append(f'build {ninja_escape(obj)}: {rule} {ninja_escape(os.path.join(self.ws.root, src))}')
                lines.append(f'  src = {ninja_escape(src)}')
                lines.append(f'  flags = {ninja_escape(sh(self.flags(t, src)))}')
                objs.append(obj)

            if t.kind == 'cc_binary':
                binaries.append((t, objs))
            elif self.ana.attr(t, 'alwayslink', False):
                forced += objs
            else:
                libs += objs

        name = self.args.name
        installs = []
        lib_dir = os.path.join(self.args.prefix, 'lib')
        env = []
        outputs = []

        if libs:
            archive = os.path.join(self.out, f'lib{name}.a')
            lines.append(f'build {ninja_escape(archive)}: ar {" ".join(ninja_escape(o) for o in libs)}')
            installs.append(['cp', archive, lib_dir + '/'])
            outputs.append(archive)

        if forced:
            # alwayslink objects go whole into every consumer. The archive sits
            # in a subdirectory so the generic env (-l for each lib*.a) leaves
            # it alone, and LDFLAGS carries it between --whole-archive marks;
            # partial links (-r) drop LDFLAGS, so nothing gets merged twice.
            archive = os.path.join(self.out, 'alwayslink', f'lib{name}.a')
            dst = os.path.join(lib_dir, 'alwayslink', f'lib{name}.a')
            lines.append(f'build {ninja_escape(archive)}: ar {" ".join(ninja_escape(o) for o in forced)}')
            installs.append(['mkdir', '-p', os.path.dirname(dst)])
            installs.append(['cp', archive, dst])
            outputs.append(archive)
            env.append(f'export LDFLAGS="-Wl,--whole-archive {dst} -Wl,--no-whole-archive ${{LDFLAGS}}"')

        # consumers of the installed library see what the requested targets
        # export, as Bazel dependents would: not implementation_deps
        ctx = Compile()

        for top in tops:
            t = self.ws.target(self.ana.actual(self.ws.canon('', top)))

            if t.kind == 'cc_library':
                ctx.merge(self.export(t))

        for t, objs in binaries:
            exe = os.path.join(self.out, 'bin', t.pkg, t.name)
            dirs.add(os.path.dirname(exe))
            ins = objs + forced + ([os.path.join(self.out, f'lib{name}.a')] if libs else [])
            opts = self.export(t).linkopts
            lines.append(f'build {ninja_escape(exe)}: link {" ".join(ninja_escape(o) for o in ins)}')
            lines.append(f'  linkopts = {ninja_escape(sh(opts))}')
            installs.append(['mkdir', '-p', os.path.join(self.args.prefix, 'bin')])
            installs.append(['cp', exe, os.path.join(self.args.prefix, 'bin', t.name)])
            outputs.append(exe)

        include = os.path.join(self.args.prefix, 'include')
        headers = {}

        for t in targets:
            if t.kind != 'cc_library':
                continue

            if t.label in self.virtual:
                for src, dst in self.virtual[t.label][1]:
                    headers[dst] = src
            else:
                for h in self.ana.files(t, 'hdrs') + self.ana.files(t, 'textual_hdrs'):
                    headers[h] = h

        for dst, src in sorted(headers.items()):
            installs.append(['mkdir', '-p', os.path.dirname(os.path.join(include, dst))])
            installs.append(['cp', os.path.join(self.ws.root, src), os.path.join(include, dst)])

        # what the installed library still asks of its consumers
        for d in ctx.defines:
            env.append(f'export CPPFLAGS="-D{d} ${{CPPFLAGS}}"')

        for i in ctx.isystem:
            env.append(f'export CPPFLAGS="-isystem{os.path.join(include, i)} ${{CPPFLAGS}}"')

        if ctx.linkopts:
            env.append(f'export LDFLAGS="${{LDFLAGS}} {" ".join(ctx.linkopts)}"')

        # virtual include trees and object directories exist before ninja runs
        for root, hs in self.virtual.values():
            for src, dst in hs:
                path = os.path.join(root, dst)
                os.makedirs(os.path.dirname(path), exist_ok=True)

                with open(os.path.join(self.ws.root, src), 'rb') as f, open(path, 'wb') as g:
                    g.write(f.read())

        for d in sorted(dirs):
            os.makedirs(d, exist_ok=True)

        install_sh = os.path.join(self.out, 'install.sh')

        with open(install_sh, 'w') as f:
            f.write('set -eu\n')
            f.write(sh(['mkdir', '-p', lib_dir, include]) + '\n')

            for i in installs:
                f.write(sh(i) + '\n')

        with open(os.path.join(self.out, 'env'), 'w') as f:
            f.write(''.join(x + '\n' for x in env))

        lines.append('')
        lines.append(f'build all: phony {" ".join(ninja_escape(o) for o in outputs)}')
        lines.append(f'build install: run {ninja_escape(install_sh)} | all')
        lines.append('default all')

        with open(os.path.join(self.out, 'build.ninja'), 'w') as f:
            f.write('\n'.join(lines) + '\n')

        return targets, libs, forced, binaries


def main():
    p = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    p.add_argument('--root', default='.', help='workspace root')
    p.add_argument('--out', required=True, help='build directory, receives build.ninja')
    p.add_argument('--prefix', required=True, help='install prefix')
    p.add_argument('--name', required=True, help='library name: lib<name>.a')
    p.add_argument('--target', action='append', default=[], required=True)
    p.add_argument('--repo', action='append', default=[], help='external repository the environment provides')
    p.add_argument('--main-repo', action='append', default=[], help='names the workspace itself goes by')
    p.add_argument('--platform', action='append', default=[], help='constraint value of the target platform')
    p.add_argument('--flag', action='append', default=[], help='build setting or flag: key=value')
    p.add_argument('--define', action='append', default=[], help='--define key=value')
    p.add_argument('--config', action='append', default=[], help='force a condition: label=1|0')
    p.add_argument('--copt', action='append', default=[])
    p.add_argument('--cxxopt', action='append', default=[])
    p.add_argument('--conlyopt', action='append', default=[])
    p.add_argument('--cc', default=os.environ.get('CC', 'cc'))
    p.add_argument('--cxx', default=os.environ.get('CXX', 'c++'))
    p.add_argument('--ar', default=os.environ.get('AR', 'ar'))
    p.add_argument('--list', action='store_true', help='print the closure and exit')
    args = p.parse_args()

    try:
        ws = Workspace(args.root, args)
        ana = Analysis(ws, args)

        if args.list:
            for t in ana.closure(args.target):
                print(t.label, t.kind)

            return

        targets, libs, forced, binaries = Generator(ana, args).generate(args.target)
        print(f'bazel_lite: {len(targets)} targets, {len(libs)} archived and {len(forced)} alwayslink objects, '
              f'{len(binaries)} binaries -> {os.path.join(args.out, "build.ninja")}', file=sys.stderr)
    except Error as e:
        print(f'bazel_lite: error: {e}', file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()

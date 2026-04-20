# Package naming conventions

Package path = package name. The directory path under `pkgs/` is the package identifier:
`pkgs/bin/neo/vim/ix.sh` → package `bin/neo/vim`.

## Rules

- Compound project names are split into path components by word boundaries:
  `neovim` → `bin/neo/vim`, `autoconf` → `bin/auto/conf`, `ghostscript` → `bin/ghost/script`,
  `firejail` → `bin/fire/jail`, `netcat` → `bin/net/cat`, `nettools` → `bin/net/tools`.
- Hyphens and underscores in upstream names become `/`:
  `terminal-use` → `bin/terminal/use`.
- Well-known project names that are a single established word stay as-is:
  `wireshark`, `openssh`, `openssl`, `darktable`, `coreutils`, `fontconfig`, `wirez`.
- Version numbers become path components:
  `autoconf 2.72` → `bin/auto/conf/2/72`, `bash 5` → `bin/bash/5`.
- Variants and sub-packages are nested:
  `bin/curl/openssl`, `bin/curl/gnutls`, `bin/neo/vim/unwrap`.
- `unwrap` suffix = full package with runtime deps; base = minimal/library version.
- `runit` suffix = service/init scripts for runit.
- `t` suffix = intermediate template package.

## Top-level directories

- `bin/` — executable binaries (built for target)
- `lib/` — libraries (built for target)
- `bld/` — build-time host tools (compilers, code generators, build systems). Built for host, not target. Used only during build of other packages.
- `aux/` — runtime data (fonts, terminfo, vendored source archives)
- `etc/` — configuration and init scripts
- `set/` — meta-package sets
- Everything outside `bld/` must be able to cross-compile for the target platform. `bld/` packages only need to run on the host.

---

# Package update procedure

## General

- Commit intermediate results: added a new lib — commit before moving on to the bin package
  that depends on it. This gives rollback points and keeps the history bisectable.
- Build output goes through the `assemble` subprocess. Use `>/path/to/log 2>&1` to capture it — output can be large.
- Builds from scratch can be very slow (compiling toolchains like cargo/rust/go from source). Always wait for the build to finish — do not interrupt or timeout.
- `loadinternal: cannot find runtime/cgo` in build logs is harmless — it's an artifact of how Go is built in ix. Ignore it.
- If a build fails, re-run with `--setx --verbose` for more detail: `./ix build <package> --setx --verbose >/path/to/log 2>&1`.
- When checking GitHub tags, use `git ls-remote --tags <repo>` to verify exact tag names (e.g. `2` vs `v2`).
- Refer to `PKGS.md` for full package development documentation (template hierarchy, blocks, etc.).

## Compiler flags — use blocks, not sed

When a package needs extra defines, includes, or compiler/linker flags, use the dedicated
blocks from `die/c/ix.sh` instead of patching Makefiles with `sed`:

| Need | Block | Result |
|------|-------|--------|
| `-DFOO=1` | `cpp_defines` | Each item → `-D<item>` in CPPFLAGS |
| `-I<path>` | `cpp_includes` | Each item → `-I<item>` in CPPFLAGS |
| `-include<hdr>` | `cpp_missing` | Each item → `-include<item>` in CPPFLAGS |
| Raw CPPFLAGS | `cpp_flags` | Items appended to CPPFLAGS as-is |
| CFLAGS | `c_flags` | Items appended to CFLAGS |
| CXXFLAGS | `cxx_flags` | Items appended to CXXFLAGS |
| LDFLAGS | `ld_flags` | Items appended to LDFLAGS |

Example — instead of `sed -i 's|_GNU_SOURCE|_GNU_SOURCE -DNCURSES_WIDECHAR=1|' Makefile`:

```jinja2
{% block cpp_defines %}
NCURSES_WIDECHAR=1
{% endblock %}
```

Reserve `sed` in `patch` block for non-flag changes (removing targets, fixing build logic).

## Shim packages — avoid patching sources and Makefiles

`lib/shim/*` packages solve common portability issues declaratively via `bld_libs`/`lib_deps`.

| Problem | Shim | Instead of |
|---------|------|------------|
| `-lfoo` fails, symbols in another lib | `lib/shim/fake(lib_name=foo)` | `sed` removing `-lfoo` from Makefile |
| `#include <old/path.h>` wrong | `lib/shim/redir(from=old/path.h,to=new.h)` | `sed` on source files |
| `pkg-config foo` fails | `lib/shim/fake/pkg(pkg_name=foo,pkg_ver=1)` | patching configure |
| Need `-lfoo` in LDFLAGS | `lib/shim/dll(dll_name=foo)` | manual `export LDFLAGS` |
| Build needs tool (e.g. asciidoctor) but output unused | `bld/fake/er(tool_name=foo)` in `bld_tool` | installing heavy toolchains |

Shims should go in `bld_libs`, not `lib_deps`, so they don't propagate to downstream packages.
Only use `lib_deps` for shims when downstream genuinely needs the same workaround.

See PKGS.md §20 for the full shim catalog.

**Rule of thumb:** if you're about to `sed` a Makefile or source file, check if a compiler
flag block (§19) or a shim (§20) can do it instead. `sed` in `patch` should be the last resort.

## Mixed C++/Rust packages (cxx-build)

When upstream uses both C++ and Rust via cxx/cxx-build, split into two packages:

1. **`lib/foo`** — extends `die/rust/cargo.sh`. Builds the Rust FFI staticlib and cxxbridge
   headers. Override `install` to copy `.a` + headers (preserve upstream dir structure).
   Use `cargo_packages` to build only the FFI crate.
2. **`bin/foo`** — extends `die/c/make.sh`. Patches out cargo invocations from Makefile,
   points include path to prebuilt cxxbridge headers from `lib/foo`.

## The `env` block — exporting paths to consumers

When a library needs to expose a path or variable to its consumers, use the `env` block
instead of parsing `CPPFLAGS`/`LDFLAGS` with `sed`/`grep`/`tr` in the consumer.

In the library:
```jinja2
{% block env %}
export MY_LIB_INCLUDE="${out}/include"
{% endblock %}
```

In the consumer's `patch` block, use `${MY_LIB_INCLUDE}` directly.

See PKGS.md §18 for the full reference.

## Rust linking: how `rustcc` works and why errors appear 3 times

Rust packages in ix use a `cc` wrapper (`bld/rust/helpers/cc/cc.py`) that tries **three
compilers** in sequence for every link invocation:

1. **freestanding clang** — `-nostdlib -nostdlib++ -fuse-ld=lld`
2. **target_cc** — the target C compiler with full flags
3. **host_cc** — the host C compiler

For each compiler it tries the raw command, then a filtered version (strips `-lunwind`,
`-lgcc_s`, `-lc`, self-contained `.o` files). That's up to **6 attempts** total.

**Consequence:** when a library is missing from `bld_libs`, the linker error (`undefined
symbol: ...`) appears **multiple times** in the log — once per failed attempt. This is
normal, not a sign of multiple distinct failures. Read the **symbol names** to diagnose:

| Undefined symbols | Missing dependency |
|---|----|
| `onig_*` | `lib/oniguruma` |
| `sdallocx`, `mallocx`, `rallocx` | jemalloc (bundled, needs `lib/c`) |
| `_Unwind_*`, `memcpy`, `memset` | freestanding attempt — ignore, look at target_cc error |
| `pcre2_*` | `lib/pcre/2` |
| `SSL_*`, `EVP_*` | `lib/openssl` |

**Rule:** if a Rust package fails to link, check `bld_libs` first. Add the missing C
library — don't assume OOM or compiler bug.

## Refine blocks — patching sources during fetch

The `*_refine` blocks run **during the fetch/vendor step** (inside `aux/fetch`), before
the `.pzd` archive is packed. Use them when sources need modification before dependency
resolution (e.g. fixing `go.mod` version before `go mod tidy`).

| Template | Refine block | Runs during | Use case |
|----------|-------------|-------------|----------|
| `die/go/build.sh` | `go_refine` | `aux/go/v3` fetch, before `go mod tidy` | Fix go.mod version, add/remove deps |
| `die/rust/cargo.sh` | `cargo_refine` | `aux/cargo/v3` fetch, after download | Run npm/make for codegen before cargo vendor |
| `die/std/ix0.sh` | `git_refine` | `aux/fetch` for git repos | Patch sources before packing |

The refine content is base64-encoded and passed to the fetch job. If the refine block
needs build tools, list them in `*_refine_tools` (e.g. `cargo_refine_tools`).

**`go_refine` example** — fix old go.mod (e.g. `go 1.16` with deps needing 1.17+):
```jinja2
{% block go_refine %}
sed -e 's|go 1.16|go 1.21|' -i go.mod
go mod tidy -compat=1.21
{% endblock %}
```

**`cargo_refine` example** — run npm to generate webui before cargo vendor:
```jinja2
{% block cargo_refine %}
make webui-deps
{% endblock %}

{% block cargo_refine_tools %}
bld/npm
bld/make
{% endblock %}
```

**Key difference from `patch`:** `patch` runs during the main build (after fetch/unpack).
`*_refine` runs during fetch — changes affect the `.pzd` archive and its sha. If you
change a refine block, you must re-derive the sha (set to zeros and rebuild).

## Packaging patterns

- **autorehell > autohell** — always use `die/c/autorehell.sh`; `autohell.sh` only if autoreconf fails.
- **Build tools from bld/, not bin/** — `bld/bison`, `bld/perl`, not `bin/bison/3/8`. `bin/` may trigger full source builds.
- **`bld/auto/archive`** — add to `bld_tool` when `configure.ac` uses `AX_*` macros.
- **`pip/PyYAML`, `pip/Mako`** — for python build deps in `bld_libs` (see mesa).
- **Go multi-binary repos** — use `t/` template + per-binary packages + hub (see `bin/nebula/`).
- **`step_unpack` for cd** — `step_unpack` runs in `{}` (cd persists), `step_patch` in `()` (cd lost).
- **Bypass cmake FindPackage** — `wrap_cc` provides paths; sed away `find_package()` and set vars directly.
- **Grep error tokens in repo** — unknown type/header? grep the repo first — often there's an existing recipe.
- **Don't fake tools that exist** — search `pkgs/` before using `bld/fake/er`.
- **Fix vendored code, don't skip** — broken bundled third-party code is usually a one-line sed fix.
- **Study Arch/Void/Alpine** — when stuck, check how other distros package it.

See PKGS.md §24 for detailed recipes and examples.

## CI sets — register new packages

Every new package must be added to a CI set so it gets built in CI:

- **C/C++/Go packages** → `set/ci/unwrap/linux/x86_64` (append to `run_deps` block)
- **Rust packages** → `set/ci/tier/1` (append to `run_deps` block)

Do this after the package builds successfully and is committed.

## Three types of sha in packages

### 1. `fetch` block sha (C/C++ packages)

Used in packages extending `die/c/*.sh` templates. The `fetch` block contains a URL and the **sha256 of the downloaded tarball itself**.

```jinja2
{% block fetch %}
https://example.com/foo-1.0.tar.gz
46e072d5d45c9fd3d5b268523501bbea0ad016232b2d3f366a7aad0b1e7b3f71
{% endblock %}
```

To update: download the new tarball and compute `sha256sum` directly. This is a straightforward hash of the archive file.

### 2. `go_sha` (Go packages, `die/go/build.sh`)

The `go_sha` is the sha256 of the **internally built `.pzd` archive** — a packed, vendored source tree with resolved Go modules. It is NOT the hash of the downloaded tarball.

Blocks: `go_url`, `go_sha`, `go_tool` (compiler version, e.g. `bin/go/lang/25`).

### 3. `cargo_sha` (Rust packages, `die/rust/cargo.sh`)

Same principle as `go_sha` — the sha256 of the **internally built `.pzd` archive** with vendored Rust crate dependencies. NOT the hash of the source tarball.

Blocks: `cargo_url`, `cargo_sha`, `cargo_tool` (compiler version, e.g. `bld/cargo/86`).

### 4. `git_sha` (git-sourced packages, `die/std/ix0.sh`)

Used when sources are cloned from a git repo (instead of downloading a tarball). The sha256 is of the **internally built `.pzd` archive** from the git checkout. NOT a commit hash.

Blocks: `git_repo`, `git_branch`, `git_commit`, `git_sha`.

## How `.pzd` sha works (go_sha, cargo_sha, git_sha)

All three go through the `aux/fetch` intermediate build step which:
1. Downloads/clones the source
2. Runs language-specific dependency resolution (go mod vendor / cargo vendor / git submodule update)
3. Packs everything into a deterministic `.pzd` archive via `stable_pack_v3`
4. Verifies the `.pzd` hash matches the declared sha

The sha changes whenever source code OR resolved dependencies change.

## Updating packages with `.pzd` sha (go_sha, cargo_sha, git_sha)

1. Update the URL/version/branch.
2. Set the sha to all zeros: `0000000000000000000000000000000000000000000000000000000000000000`. This invalidates the cache and forces a full rebuild — without this, the build system may reuse a cached `.pzd` with the old hash.
3. Update the compiler/tool version if needed (check `go.mod` for Go version, rust-toolchain for Rust).
4. Run `./ix build <package> >/path/to/log 2>&1`. It will fail with a checksum mismatch.
5. Find the real sha256 in the log — look for the `sha256sum` output line showing the actual hash of the `.pzd` file.
6. Replace the zeros with the real hash.
7. Run `./ix build <package>` again — it should succeed.

## Updating packages with `fetch` sha (C/C++ packages)

1. Update the version in the `version` block.
2. Compute the new tarball hash: `curl -sL <new_url> | sha256sum`.
3. Replace the old hash in the `fetch` block.
4. Run `./ix build <package> >/path/to/log 2>&1` and fix any build errors.

## Misc

- Go toolchains live at `bin/go/lang/<N>`. Each version extends a predecessor (`{% extends '//bin/go/lang/22/ix.sh' %}`) and declares a `{% block go_bootstrap %}` pointing at the intermediate version used to compile it — e.g. 25 extends 22 but bootstraps from 23. To add a minor, clone the closest neighbour and adjust `version`/`fetch`/`go_bootstrap`.
- Services are supervised by `bin/runsrv` (package) — the runit template in `pkgs/etc/services/runit/script/ix.sh` just emits a thin `run` that execs `srv <sd> /bin/sh ${PWD}/hi`. The service stdout/stderr pipe through `bin/tinylog` into `/var/run/<sd>/std/current` (live) with rotated `_<ts>.s` archives. There is no `sv` command; status is "does the process exist + does the log move".

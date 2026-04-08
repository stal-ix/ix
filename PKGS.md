# ix Package Development Guide

ix is a source-based, content-addressed package manager and meta-build system. Package
definitions are Jinja2 templates that inherit from a hierarchy of base templates in `pkgs/die/`.
This document explains everything needed to write new packages.

---

## Table of Contents

1. [Repository Layout](#1-repository-layout)
2. [Package Anatomy](#2-package-anatomy)
3. [Template Inheritance Chain](#3-template-inheritance-chain)
4. [Choosing a Template](#4-choosing-a-template)
5. [Fetching Sources](#5-fetching-sources)
6. [Declaring Dependencies](#6-declaring-dependencies)
7. [Build Steps](#7-build-steps)
8. [Postinstall: What Gets Kept](#8-postinstall-what-gets-kept)
9. [Build System Specifics](#9-build-system-specifics)
10. [Rust Packages](#10-rust-packages)
11. [Go Packages](#11-go-packages)
12. [Meta-packages (hub)](#12-meta-packages-hub)
13. [Generated/Config Packages (gen)](#13-generatedconfig-packages-gen)
14. [Versioned Sub-packages](#14-versioned-sub-packages)
15. [Package Flags and Parametrization](#15-package-flags-and-parametrization)
16. [Build Flags](#16-build-flags)
17. [Cross-compilation](#17-cross-compilation)
18. [Environment During Build](#18-environment-during-build)
19. [Compiler Flags Blocks](#19-compiler-flags-blocks)
20. [Shim Packages](#20-shim-packages)
21. [Content Addressing and UIDs](#21-content-addressing-and-uids)
22. [Complete Examples](#22-complete-examples)
23. [Common Pitfalls](#23-common-pitfalls)

---

## 1. Repository Layout

```
pkgs/
├── bin/      binaries and executable tools
├── lib/      static libraries and headers
├── bld/      build-time host tools (compilers, cmake, ninja, …)
├── aux/      runtime data (fonts, terminfo, ca-bundle, cargo index, …)
├── etc/      configuration and init scripts
├── set/      meta-package sets (collections of bin/ packages)
├── org/      organized / special-purpose packages
└── die/      templates — the core of the build system
    ├── base.json       root JSON descriptor template
    ├── ix.json         standard variable blocks
    ├── base.sh         build-step scaffolding
    ├── sh.sh / sh0–sh2 isolation, env, cleanup layers
    ├── hub.sh          meta-package (no build)
    ├── gen.sh          generated files (no compile)
    ├── c/              C/C++ templates (make, cmake, meson, …)
    ├── rust/           Rust/Cargo template
    ├── go/             Go modules templates
    ├── python/         Python freeze template
    ├── std/            standard helpers (postinstall, env_auto, …)
    └── dl/             dynamic-library support
```

Every package is a **directory** somewhere under `pkgs/` that contains an `ix.sh` file.
The directory path doubles as the package name: `pkgs/bin/git/unwrap/ix.sh` → `bin/git/unwrap`.

---

## 2. Package Anatomy

`ix.sh` is a Jinja2 template. The first line is always an `{% extends %}` directive that
selects the build-system template. Everything else is block overrides.

Minimal example — a C program built with plain Make:

```jinja2
{% extends '//die/c/make.sh' %}

{% block pkg_name %}
minised
{% endblock %}

{% block version %}
1.16
{% endblock %}

{% block fetch %}
http://dl.exactcode.de/oss/minised/minised-{{self.version().strip()}}.tar.gz
46e072d5d45c9fd3d5b268523501bbea0ad016232b2d3f366a7aad0b1e7b3f71
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
```

That is the complete package definition for `bin/minised`. No Makefile is shipped — the
template knows how to call `make` and `make install` and how to set `PREFIX`.

### Key Jinja2 conventions

| Syntax | Meaning |
|--------|---------|
| `{% extends '//die/c/cmake.sh' %}` | inherit from template; `//` means `pkgs/` root |
| `{% block name %} … {% endblock %}` | override a named block from the parent |
| `{{super()}}` | include the parent block's content at this position |
| `{{self.version().strip()}}` | call another block as a method, useful inside `fetch` |
| `{{target.rust}}`, `{{host.go_arch}}` | architecture variables (see §17) |
| `{{uniq_id}}` | content-addressed UID of this package |
| `{{out}}`, `{{tmp}}`, `{{src}}` | build directory variables (see §18) |

Blocks that contain **lists of items** (deps, flags) are whitespace-separated; the template
infrastructure converts them to JSON arrays automatically via the `parse_list` / `list_to_json`
filters.

---

## 3. Template Inheritance Chain

Understanding the chain helps you know which blocks exist and what they do.

```
base.json                    ← JSON descriptor structure
  └── ix.json                ← standard dep/fetch variable blocks
        └── script.json      ← wraps build script in JSON
              └── sh0.sh     ← build isolation (jail / tmpfs / unshare)
                    └── sh2.sh   ← prepare_f / cleanup_f / fix_mtime / chmod_ro
                          └── sh.sh    ← source_env(), toolchain setup helpers
                                └── base.sh  ← step_* functions + do_* pipeline
                                      └── die/std/ix.sh   ← postinstall, strip, purge_dynlib
                                            └── die/c/ix0.sh  ← wrap_cc plugin injection
                                                  └── die/c/ix1.sh  ← compiler init
                                                        └── die/c/ix2.sh  ← host/target TC setup
                                                              └── die/c/ix3.sh  ← CPPFLAGS / CFLAGS / LDFLAGS
                                                                    └── die/c/ix.sh   ← base C package
                                                                          ├── make.sh
                                                                          │     ├── configure.sh
                                                                          │     │     └── autohell.sh
                                                                          │     │           └── autorehell.sh
                                                                          ├── ninja.sh
                                                                          │     ├── cmake.sh
                                                                          │     └── meson.sh
                                                                          ├── waf.sh
                                                                          ├── gn.sh
                                                                          └── kconfig.sh
```

Rust and Go share `die/c/ix.sh` as their base, then diverge:

```
die/c/ix.sh
  ├── die/rust/cargo.sh
  └── die/go/base.sh
        └── die/go/build.sh   ← adds vendored module support
```

---

## 4. Choosing a Template

| Template | `{% extends … %}` | When to use |
|----------|-------------------|-------------|
| GNU Make | `//die/c/make.sh` | `make && make install`, no configure script |
| Autoconf | `//die/c/configure.sh` | `./configure && make && make install` |
| Autotools | `//die/c/autohell.sh` | autoconf + automake, `autoreconf` needed |
| CMake | `//die/c/cmake.sh` | CMake |
| Meson | `//die/c/meson.sh` | Meson |
| Ninja (raw) | `//die/c/ninja.sh` | Ninja without CMake/Meson |
| WAF | `//die/c/waf.sh` | WAF build system |
| GN | `//die/c/gn.sh` | Google's GN (Chromium ecosystem) |
| Kconfig | `//die/c/kconfig.sh` | Linux kernel-style Kconfig |
| Rust/Cargo | `//die/rust/cargo.sh` | Cargo packages (uses vendored `.pzd`) |
| Go modules | `//die/go/build.sh` | Go (uses vendored `.pzd`) |
| Meta | `//die/hub.sh` | No build; just wires together other packages |
| Generated | `//die/gen.sh` | Shell-only install step, no compilation |

When unsure, look for a package in `pkgs/` that uses a similar build system and copy its
template choice. Use `grep -r 'extends' pkgs/bin/ | grep cmake` etc. to find examples.

---

## 5. Fetching Sources

### Tarball (preferred)

```jinja2
{% block fetch %}
https://example.com/pkg-{{self.version().strip()}}.tar.gz
0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
{% endblock %}
```

The block contains a URL on the first line and its **SHA-256 hex digest** on the second.
The digest is mandatory — builds are hermetic and the fetch is verified.

Get the digest:
```sh
curl -fsSL <url> | sha256sum
```

### Git tag / branch

```jinja2
{% block git_repo %}
https://github.com/author/repo
{% endblock %}

{% block version %}
1.2.3
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
d17c1e9630ce2de65135f2772193d73195b2b3e263d8d070f500258feaef515c
{% endblock %}
```

ix downloads `<git_repo>/archive/refs/tags/<git_branch>.tar.gz` and verifies `git_sha` against generated .pzd file with all vendored deps!

### Multiple fetch URLs

`{% block fetch %}` is parsed as a sequence of (url, sha256) pairs — just append more:

```jinja2
{% block fetch %}
https://example.com/pkg-1.0.tar.gz
aabbcc...
https://example.com/pkg-extra-data.tar.gz
ddeeff...
{% endblock %}
```

Both archives are downloaded and available under `${src}`.

---

## 6. Declaring Dependencies

Dependencies are declared via whitespace-separated lists in Jinja2 blocks.
The infrastructure converts them to JSON for the build graph.

### Overview of dependency kinds

| Block | Role |
|-------|------|
| `bld_libs` | Static libraries linked into the built artifact (target arch) |
| `bld_tool` | Executables available on `PATH` during the build (host arch) |
| `std_env` | Full override of the standard toolchain env — rarely used |
| `lib_deps` | Libraries **exported** to packages that depend on this one |
| `run_deps` | Runtime packages (binaries, data) needed when this package runs |
| `run_data` | Runtime data packages (aux/) |
| `bld_data` | Build-time data packages (aux/, cargo index, go module cache) |
| `host_libs` | Libraries for the **host** machine (cross-compilation only) |
| `ind_deps` | Induced / implicit dependencies |

### `bld_libs` — what to link against

```jinja2
{% block bld_libs %}
lib/c
lib/c++
lib/z
lib/openssl
lib/curl
lib/expat
{% endblock %}
```

Every library listed here has its headers and `.a` files exposed via `CPPFLAGS`/`LDFLAGS`
automatically through the `env_auto.sh` mechanism.

`lib/c` is required for virtually every C package. `lib/c++` for C++ packages.

### `bld_tool` — host executables

```jinja2
{% block bld_tool %}
bld/cmake
bld/pkg/config
bld/ninja
bld/perl
{% endblock %}
```

Common tools:

| Package | Provides |
|---------|----------|
| `bld/cmake` | `cmake` |
| `bld/ninja` | `ninja` |
| `bld/pkg/config` | `pkg-config` |
| `bld/make` | `make` (usually implicit via `make.sh`) |
| `bld/perl` | `perl` |
| `bld/python` | `python3` |
| `bld/bison` | `bison` + `flex` |
| `bld/m4` | `m4` |
| `bld/tar` | `tar` |
| `bld/gettext` | `msgfmt`, `xgettext` |
| `bld/go` | `go` toolchain |

### `lib_deps` — what you export

Libraries under `lib/` should declare what other libraries they depend on so that consumers
receive the full closure automatically:

```jinja2
{% block lib_deps %}
lib/z
lib/openssl
{% endblock %}
```

When `lib/mypkg` has `lib/z` in `lib_deps`, any package that adds `lib/mypkg` to its
`bld_libs` automatically also gets `lib/z` linked in — no need to repeat it.

### `run_deps` — runtime packages

```jinja2
{% block run_deps %}
bin/openssh/client
bin/git/cred
lib/ncurses
{% endblock %}
```

These packages are composed into the system realm when this package is installed.

### Flags on dependencies

Any dependency can be parametrized with flags in parentheses:

```jinja2
{% block bld_libs %}
lib/c
lib/curl(libcurl_ver=http1)
{% endblock %}

{% block run_deps %}
bin/python(python_ver=12)
{% endblock %}
```

---

## 7. Build Steps

`base.sh` defines a pipeline of step functions. They are composed by `do_*` functions:

```
do_execute()
  └── do_test()
        └── do_install()
              └── do_build()
                    └── do_configure()
                          └── do_patch()
                                └── do_setup()
                                      └── do_unpack()
                                            step_unpack()
                                      step_setup()
                                step_patch()
                          step_configure()
                    step_build()
              step_install()
        step_test()
```

You override the block that corresponds to the step you want to customise.
Use `{{super()}}` to keep the parent behaviour and add to it.

### Common overrides

#### `unpack` — custom extraction

```jinja2
{% block unpack %}
{{super()}}
mv pkg-{{self.version().strip()}} src
{% endblock %}
```

The default unpacker (from `std/unpack.sh`) handles `.tar.gz`, `.tar.xz`, `.tar.bz2` and `.zip`.

#### `patch` — apply patches

```jinja2
{% block patch %}
{{super()}}
patch -p1 < ${source}/fix-build.patch
sed -i 's|/usr/include|${out}/include|g' Makefile.in
{% endblock %}
```

Files that live next to `ix.sh` in the package directory are accessible as `${source}/filename`.

#### `setup` — pre-configure environment tweaks

```jinja2
{% block setup_target_flags %}
export FORCE_UNSAFE_CONFIGURE=1
{{super()}}
{% endblock %}
```

#### `configure` — custom configure invocation

```jinja2
{% block configure %}
{{super()}}
{% endblock %}
```

For `configure.sh`-based packages the default configure call is built from `configure_flags`.
Override only `configure_flags` to add flags rather than replacing the whole invocation.

#### `build` — custom build step

```jinja2
{% block build %}
make -j$(nproc) EXTRA=yes
{% endblock %}
```

#### `install` — custom install step

```jinja2
{% block install %}
make DESTDIR=${out} install
mkdir -p ${out}/share/myapp
cp -r assets/ ${out}/share/myapp/
{% endblock %}
```

The output directory is `${out}`. Everything placed there becomes the package artifact.

---

## 8. Postinstall: What Gets Kept

After your `install` block runs, `std/postinstall.sh` performs automatic cleanup and
validation based on the **package kind**:

The package kind (`bin`, `lib`, `aux`) is inferred from the directory:
- `pkgs/bin/*` → `bin=1`
- `pkgs/lib/*` → `lib=1`
- `pkgs/aux/*` → `aux=1`

### For `bin` packages

- `${out}/lib/` and `${out}/include/` are **deleted** (binaries don't ship headers)
- Executables in `${out}/bin/` are stripped with `llvm-strip -S`
- All `.a` and `.o` files are deleted
- Broken symlinks are removed
- Empty directories are pruned

To skip stripping (e.g. for Go binaries that embed debug info):

```jinja2
{% block strip_bin %}
echo 'skip strip'
{% endblock %}
```

Or use the `nostrip` flag: `bin/mypkg(nostrip=1)`.

### For `lib` packages

- `${out}/bin/` is deleted **except** for `*-config` scripts which are moved to `${out}/lib/bin/`
- `${out}/share/cmake` is moved to `${out}/lib/`
- `${out}/share/` is moved to `${out}/lib/aux/`
- `${out}/libexec/`, `${out}/etc/` are deleted
- All `.so`, `.so.*`, `.la` files are deleted (ix is static-only by default)
- `.pc` files referencing `/bin` paths in a `lib` package cause a build error — override
  `strip_pc` to acknowledge intentional exceptions

### For `aux` packages

- Only data files are kept; `${out}/bin/`, `${out}/lib/`, `${out}/include/`, `${out}/doc/` are removed

### `.pc` file validation

If a `.pc` file is found in a `lib` package that references `/bin`, the build fails with
`BAD PKG`. Either remove the offending `.pc` during install or suppress with:

```jinja2
{% block strip_pc %}
find ${out}/ -name '*.pc' -delete
{% endblock %}
```

---

## 9. Build System Specifics

### GNU Make (`//die/c/make.sh`)

Adds `make` to `bld_tool`. Calls `make -j${make_thrs}` then `make install`.
The build falls back to single-threaded make if parallel fails.

Extra make variables:

```jinja2
{% block make_flags %}
LDFLAGS="${LDFLAGS}"
ENABLE_FEATURE=yes
{% endblock %}
```

Custom make target:

```jinja2
{% block make_target %}
all
{% endblock %}
```

Custom install target:

```jinja2
{% block make_install_target %}
install-strip
{% endblock %}
```

### Autoconf (`//die/c/configure.sh`)

Adds `bld/pkg/config`. Calls `sh configure --prefix=${out} …` then `make && make install`.

```jinja2
{% block configure_flags %}
--enable-static
--disable-shared
--with-zlib
--without-python
{% endblock %}
```

### Autotools (`//die/c/autohell.sh`)

Extends `configure.sh`. Additionally:
- Sets `FORCE_UNSAFE_CONFIGURE=1`
- Touches all `.y`/`.l` files so make doesn't try to regenerate them
- Patches `configure` scripts to remove `/usr/bin/` prefixes
- Passes `--build`/`--host`/`--target` for cross-compilation
- Passes `--enable-static --disable-shared` by default

Override `enable_static` if you need a different static/shared policy:

```jinja2
{% block enable_static %}
--enable-static
--enable-shared
{% endblock %}
```

Symbol rename (to avoid collisions across static libs):

```jinja2
{% block c_rename_symbol %}
__progname
getopt
{% endblock %}
```

Each symbol in this list gets renamed to `<uniq_id>_<symbol>` so multiple packages can
define the same symbol without linker conflicts.

### CMake (`//die/c/cmake.sh`)

Adds `bld/cmake` and `bld/pkg/config`. Uses Ninja as the generator.
Automatically sets:
- `CMAKE_INSTALL_PREFIX=${out}`
- `CMAKE_BUILD_TYPE=Release`
- `BUILD_SHARED_LIBS=OFF`
- `BUILD_TESTING=OFF`
- Cross-compilation variables (`CMAKE_SYSTEM_NAME`, `CMAKE_SYSTEM_PROCESSOR`) when not native

```jinja2
{% block cmake_flags %}
WITH_OPENSSL=ON
ENABLE_DOCS=OFF
MY_CUSTOM_FLAG=value
{% endblock %}
```

Each line is prefixed with `-D` automatically.

Additional raw cmake arguments (not `-D` prefixed):

```jinja2
{% block cmake_extra_flags %}
--fresh
{% endblock %}
```

Custom source directory (if CMakeLists.txt is not in the root):

```jinja2
{% block cmake_srcdir %}
src/
{% endblock %}
```

Debug: add `--help` (shorthand for `--help=1`) as a package/cli flag to run `cmake -LA` and exit, listing all cache variables.

### Meson (`//die/c/meson.sh`)

```jinja2
{% block meson_flags %}
default_library=static
tests=disabled
docs=disabled
custom_option=value
{% endblock %}
```

Each line becomes a `-D<line>` argument to `meson setup`.

Meson automatically creates a cross-file when `host_libs` is non-empty (for packages that
need to build host tools alongside target code).

### Ninja (raw) (`//die/c/ninja.sh`)

Adds `bld/ninja`. You must provide the `configure` block yourself to generate `build.ninja`.
After generation, the template sanitises the file to remove any `/usr` paths.

```jinja2
{% block configure %}
./gen-build.sh --out=${tmp}/obj
{% endblock %}
```

---

## 10. Rust Packages

```jinja2
{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
ripgrep
{% endblock %}

{% block version %}
14.1.1
{% endblock %}

{% block cargo_url %}
https://github.com/BurntSushi/ripgrep/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
deadbeef...
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block cargo_features %}
pcre2
{% endblock %}

{% block cargo_bins %}
rg
{% endblock %}
```

### How Rust builds work

Cargo in ix uses **vendored dependencies** stored as a `.pzd` archive in store.
The `cargo_url`/`cargo_sha` blocks tell the `aux/cargo` data package where to download
the crate source and vendor its dependencies.

The build is offline (`--offline`) using the vendored tree.

### Key Rust blocks

| Block | Default | Purpose |
|-------|---------|---------|
| `cargo_features` | `__default__` | Cargo features to enable. `__default__` keeps default features. List others to add, or omit `__default__` to use `--no-default-features`. |
| `cargo_bins` | (empty) | Which binaries to copy to `${out}/bin/`. |
| `cargo_packages` | (empty) | Build specific workspace packages with `--package`. |
| `cargo_profile` | `release` | Cargo profile. |
| `cargo_flags` | `build --offline --target …` | Full cargo command flags; prefer overriding sub-blocks. |
| `cargo_refine` | (empty) | Shell commands to patch source before vendoring. |

### Enabling Cargo features

```jinja2
{% block cargo_features %}
__default__    ← keep default features
extra-feature
another-one
{% endblock %}
```

Without `__default__`, `--no-default-features` is passed.

### Building a library crate (not a binary)

```jinja2
{% block cargo_flags %}
{{super()}}
--lib
{% endblock %}
```

Or set `lib=1` as a package flag.

### Patching vendored sources

```jinja2
{% block cargo_refine %}
sed -i 's|bad_call|good_call|' src/lib.rs
{% endblock %}
```

---

## 11. Go Packages

```jinja2
{% extends '//die/go/build.sh' %}

{% block pkg_name %}
git-lfs
{% endblock %}

{% block version %}
3.6.1
{% endblock %}

{% block go_url %}
https://github.com/git-lfs/git-lfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2a1f031b45960621119c571c4e82b2418567e7ebdd45514f6dded55e615312b3
{% endblock %}

{% block go_bins %}
git-lfs
{% endblock %}
```

### How Go builds work

Like Rust, Go uses vendored dependencies via a `.pzd` file in `aux/go/`.
The build runs `go build -mod=vendor` offline.

`GOOS` and `GOARCH` are set from the target architecture automatically.

### Key Go blocks

| Block | Default | Purpose |
|-------|---------|---------|
| `go_bins` | (empty) | Binaries to copy to `${out}/bin/`. |
| `go_tags` | (empty) | Build tags passed as `-tags a,b,c`. |
| `go_build_flags` | `-mod=vendor` | Extra `go build` flags. |
| `go_refine` | (empty) | Shell commands to patch vendored modules. |
| `go_tool` | `bin/go/lang/21` | Go toolchain version. |

Build tags example:

```jinja2
{% block go_tags %}
netgo
osusergo
static_wasm
{% endblock %}
```

---

## 12. Meta-packages (hub)

A hub package has no source and no build. It just declares which other packages form a
logical unit. Use it to group things a user would want together, or to provide a stable
name that selects an implementation at build time.

```jinja2
{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/git/cred
bin/git/unwrap
bin/openssh/client
{% endblock %}
```

### Version dispatch via hub

The canonical `lib/z` is itself a hub that dispatches to an implementation based on flags:

```jinja2
{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/z/{{zlib_ver or ('ng' if x86_64 else 'adler')}}
{% endblock %}
```

This means:
- `lib/z` with default flags on x86_64 → `lib/z/ng`
- `lib/z(zlib_ver=stock)` → `lib/z/stock`
- On non-x86_64 → `lib/z/adler`

This is the idiomatic way to have a default implementation that can be overridden.

---

## 13. Generated/Config Packages (gen)

For packages that only generate configuration files, init scripts, or other data without
compiling anything.

```jinja2
{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/etc/myapp
cat > ${out}/etc/myapp/config.conf << 'EOF'
option = value
EOF
chmod 644 ${out}/etc/myapp/config.conf
{% endblock %}
```

`gen.sh` skips the unpack step entirely. Only `step_setup` (which sources the target env)
and your `install` block run.

### Parametrized gen packages

```jinja2
{% extends '//die/gen.sh' %}

{% set device %}{% block device %}{% endblock %}{% endset %}

{% block install %}
mkdir -p ${out}/etc/runit/1.d

cat > ${out}/etc/runit/1.d/10-{{device}}.sh << EOF
#!/bin/sh
mount /dev/{{device}} /mnt
EOF

chmod 755 ${out}/etc/runit/1.d/10-{{device}}.sh
{% endblock %}
```

Usage: `etc/mydevice(device=sda1)`.

---

## 14. Versioned Sub-packages

When a library has multiple incompatible versions in concurrent use, the pattern is:

```
pkgs/lib/openssl/          ← hub, dispatches to versioned impl
pkgs/lib/openssl/3/        ← OpenSSL 3.x implementation
pkgs/lib/openssl/1/        ← OpenSSL 1.1 implementation (legacy)
```

The hub `lib/openssl/ix.sh`:

```jinja2
{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/openssl/{{libopenssl_ver or '3'}}
{% endblock %}
```

Consumers write `lib/openssl` and get version 3 by default.
To pin a specific version: `lib/openssl(libopenssl_ver=1)`.

The actual implementation at `lib/openssl/3/ix.sh` extends a real build template (`t/ix.sh`
is a local relative reference to a shared template within the package subtree).

This pattern applies to: `lib/z`, `lib/openssl`, `lib/curl`, `lib/c++`, `lib/llvm`, etc.

---

## 15. Package Flags and Parametrization

Flags are key-value pairs passed when referencing a package:

```
bin/python(python_ver=12)
lib/curl(libcurl_ver=http1)
etc/zram/0(zram_size=4096)
```

Inside `ix.sh`, flags are available as Jinja2 variables:

```jinja2
{% block configure_flags %}
--with-python={{python_ver | default('3')}}
{% endblock %}
```

Or with a conditional:

```jinja2
{% block cmake_flags %}
WITH_TESTS={{enable_tests | default('OFF')}}
{% endblock %}
```

### Boolean flags

Flags without a value are treated as booleans:

```jinja2
{% if debug %}
{% block cmake_flags %}
CMAKE_BUILD_TYPE=Debug
{% endblock %}
{% endif %}
```

Usage: `bin/mypkg(debug=1)`.

### Architecture flags

Architecture-derived boolean flags are available directly:

| Variable | True when |
|----------|-----------|
| `x86_64` | target is x86-64 |
| `aarch64` | target is AArch64 |
| `linux` | target OS is Linux |
| `mingw32` | target is Windows/MinGW |
| `native` | host == target (no cross-compilation) |
| `boot` | building a toolchain bootstrap package |

---

## 16. Build Flags

Build flags are special flags that control the build infrastructure. They are passed in
`build_flags` and tested with `'flag' in build_flags`.

| Flag | Effect |
|------|--------|
| `wrap_cc` | Use the compiler wrapper (`bld/wrap/cc`) for fine-grained compiler control |
| `wrap_rdynamic` | Pass `-rdynamic` for executables (shared-library plugins) |
| `compress` | Compress executables with `packexe` after install |
| `fix_shebangs` | Rewrite shebangs in installed scripts to absolute paths |
| `no_werror` | Add `-Wno-error` to `CPPFLAGS` |
| `shut_up` | Add `-w` to `CPPFLAGS` (suppress all warnings) |

Setting flags on your own package:

```jinja2
{% block build_flags %}
{{super()}}
compress
{% endblock %}
```

---

## 17. Cross-compilation

ix is cross-compilation-aware throughout the stack. The template system exposes two
architecture objects: `host` (the machine running the build) and `target` (the machine
that will run the result).

### Architecture properties

Both `host` and `target` expose the same fields:

| Field | Example (x86-64 Linux) | Description |
|-------|------------------------|-------------|
| `arch` | `x86_64` | GNU architecture name |
| `bits` | `64` | Word size |
| `os` | `linux` | OS name |
| `rust` | `x86_64-unknown-linux-musl` | Rust target triple |
| `go_arch` | `amd64` | Go GOARCH |
| `cmake_system_name` | `Linux` | CMake `CMAKE_SYSTEM_NAME` |
| `uname_m` | `x86_64` | `uname -m` |
| `uname_s` | `Linux` | `uname -s` |
| `gnu.three` | `x86_64-linux-musl` | GNU triplet |
| `exe_suffix` | `  ` or `.exe` | Executable suffix |
| `llvm_target` | `x86_64-linux-musl` | LLVM target |

Usage in templates:

```jinja2
{% block make_flags %}
uname_S={{target.uname_s}}
uname_M={{target.uname_m}}
{% endblock %}
```

### Host libraries (`host_libs`)

When a package needs to build host-arch tools during its own build (e.g., code generators),
declare them in `host_libs`:

```jinja2
{% block host_libs %}
lib/c
lib/z
{% endblock %}
```

This triggers separate `HOST_CC`/`HOST_CXX` setup alongside the target toolchain.
meson.sh template automatically generates a native file (`native.ini`) when `host_libs` is non-empty.

### Testing native vs cross

```jinja2
{% if native %}
# host == target, no cross-compilation
{% else %}
# cross-compiling
{% endif %}
```

---

## 18. Environment During Build

The build script runs in an isolated environment. Key shell variables:

| Variable | Description |
|----------|-------------|
| `${out}` | Output directory — the package artifact |
| `${tmp}` | Temporary build directory |
| `${src}` | Source files from `fetch` (archives unpacked here) |
| `${bld}` | Build workspace (inside `${tmp}`) |
| `${uid}` | Content-addressed UID of this package |
| `${make_thrs}` | Thread count for parallel builds |
| `${IX_B_DIR}` | Colon-separated paths to host build tools |
| `${IX_H_DIR}` | Colon-separated paths to host libraries |
| `${IX_T_DIR}` | Colon-separated paths to target libraries |

`PATH` is constructed from `${IX_B_DIR}` entries plus the current directory (for wrapper
scripts created by the toolchain setup). No host system paths are in `PATH` — builds are
hermetic.

### Auto-environment sourcing

Each library in `${IX_T_DIR}` has an `env` shell script generated by `env_auto.sh` that
exports appropriate flags:

```sh
export CPPFLAGS="-I/ix/store/<hash>-lib-z/include ${CPPFLAGS}"
export LDFLAGS="-L/ix/store/<hash>-lib-z/lib -lz ${LDFLAGS}"
export PKG_CONFIG_PATH="/ix/store/<hash>-lib-z/lib/pkgconfig:${PKG_CONFIG_PATH}"
export CMAKE_PREFIX_PATH="/ix/store/<hash>-lib-z:${CMAKE_PREFIX_PATH}"
```

These are sourced automatically before configure/build. You do not need to hardcode
library paths.

---

## 19. Compiler Flags Blocks

`die/c/ix.sh` (via `ix3.sh`) provides fine-grained blocks for compiler flag injection:

| Block | Becomes |
|-------|---------|
| `cpp_flags` | Appended to `CPPFLAGS` |
| `cpp_defines` | `-D<name>` entries in `CPPFLAGS` |
| `cpp_includes` | `-I<path>` entries in `CPPFLAGS` |
| `cpp_missing` | `-include<header>` entries in `CPPFLAGS` |
| `c_flags` | Appended to `CFLAGS` |
| `cxx_flags` | Appended to `CXXFLAGS` |
| `ld_flags` | Appended to `LDFLAGS` |
| `c_rename_symbol` | Symbols renamed to `<uniq_id>_<symbol>` |

Example:

```jinja2
{% block cpp_defines %}
_GNU_SOURCE
_LARGEFILE64_SOURCE
{% endblock %}

{% block cpp_includes %}
/some/special/path
{% endblock %}

{% block ld_flags %}
-pthread
{% endblock %}
```

### Exporting flags to downstream consumers

If your library needs to propagate flags to packages that link against it, use the `env` block
(visible in `lib/openssl/3/ix.sh`):

```jinja2
{% block env %}
{{super()}}
export COFLAGS="--with-my-feature ${COFLAGS}"
{% endblock %}
```

`COFLAGS` gets sourced when another package's configure script runs with this library in scope.

---

## 19. Compiler Flags Blocks

These blocks (defined in `die/c/ix.sh`) let you inject compiler and linker flags without
patching Makefiles or build scripts with `sed`. All items are whitespace-separated lists.

### `cpp_defines` — preprocessor defines

Each item becomes `-D<item>` in `CPPFLAGS`. Use `NAME=VALUE` for defines with values.

```jinja2
{% block cpp_defines %}
_GNU_SOURCE
NCURSES_WIDECHAR=1
HAVE_OPENSSL=1
{% endblock %}
```

### `cpp_includes` — extra include paths

Each item becomes `-I<item>` in `CPPFLAGS`.

```jinja2
{% block cpp_includes %}
${PWD}/lib/fizzy
${PWD}
{% endblock %}
```

### `cpp_missing` — force-include headers

Each item becomes `-include<item>` in `CPPFLAGS`. Used to inject missing headers that
upstream code forgot to include.

```jinja2
{% block cpp_missing %}
stdint.h
limits.h
{% endblock %}
```

### `cpp_flags` — raw preprocessor flags

Raw flags appended to `CPPFLAGS`. Use for flags that don't fit the above blocks
(e.g. `-isystem`).

```jinja2
{% block cpp_flags %}
-isystem${NSS_HEADERS}
{% endblock %}
```

### `c_flags` — C compiler flags

Appended to `CFLAGS`. For C-specific compiler flags.

```jinja2
{% block c_flags %}
-fcommon
-std=c11
{% endblock %}
```

### `cxx_flags` — C++ compiler flags

Appended to `CXXFLAGS`. For C++-specific compiler flags.

```jinja2
{% block cxx_flags %}
-Wno-missing-template-arg-list-after-template-kw
{% endblock %}
```

### `ld_flags` — linker flags

Appended to `LDFLAGS`.

```jinja2
{% block ld_flags %}
-Wl,-z,nostart-stop-gc
{% endblock %}
```

### When to use flag blocks vs `sed`

Prefer flag blocks over patching Makefiles with `sed`:

| Need | Block | Not this |
|------|-------|----------|
| Add a `-D` define | `cpp_defines` | `sed -i 's\|CFLAGS\|CFLAGS -DFOO\|'` |
| Add an include path | `cpp_includes` | `sed -i 's\|CPPFLAGS\|CPPFLAGS -I...\|'` |
| Force-include a header | `cpp_missing` | `sed -i 's\|#include\|#include <missing.h>\n#include\|'` |
| Add a C/C++ flag | `c_flags` / `cxx_flags` | `sed` on Makefile |
| Add a linker flag | `ld_flags` | `sed` on Makefile |

Use `sed` in `patch` block only for changes that are not about compiler/linker flags
(fixing paths, removing targets, patching source logic).

---

## 20. Shim Packages

Shim packages under `lib/shim/` solve common build-system integration problems without
patching source code. **Prefer `bld_libs`** for shims — this keeps the workaround local to
the current package. Only put shims in `lib_deps` when downstream consumers genuinely need
the same fix (rare).

### `lib/shim/fake` — empty stub library

Creates an empty `lib<name>.a` so that `-l<name>` doesn't fail at link time. Used when
the real symbols come from another package under a different name (e.g. `lib/ncurses`
provides ncursesw symbols but installs as `libncurses.a`, not `libncursesw.a`).

```jinja2
{% block bld_libs %}
lib/shim/fake(lib_name=ncursesw)
lib/shim/fake(lib_name=stdc++fs)
{% endblock %}
```

### `lib/shim/fake/pkg` — fake pkg-config `.pc` file

Generates a `.pc` file for pkg-config so that `pkg-config --cflags/--libs <name>` succeeds.
Used when a dependency check must pass but the real library is provided differently.

```jinja2
lib/shim/fake/pkg(pkg_name=glew,pkg_ver=1.0.0)
lib/shim/fake/pkg(pkg_name=dri,pkg_ver=100500,pkg_extra=dridriverdir: /nowhere)
```

### `lib/shim/fake/header` — stub header

Creates a header file that redirects to `stdio.h` (effectively a no-op include).

```jinja2
lib/shim/fake/header(header=cups/cups.h)
```

### `lib/shim/fake/symbol` — single symbol stub

Creates a library with a single exported symbol (function returning 0). Used when a
package references a symbol that doesn't exist in this environment.

```jinja2
lib/shim/fake/symbol(symbol_name=cupsServer)
```

### `lib/shim/redir` — header redirect

Creates a header at path `from` that `#include`s `to`. Used when upstream includes
a header under a path that differs from where ix installs it.

```jinja2
{% block bld_libs %}
lib/shim/redir(from=ncursesw/ncurses.h,to=ncurses.h)
lib/shim/redir(from=sys/sysctl.h,to=linux/sysctl.h)
{% endblock %}
```

This is better than `sed -i 's|old/path.h|new/path.h|' source.c` because it works for
all source files and doesn't modify the source tree.

### `lib/shim/dll` — inject `-l` flag

Adds `-l<name>` to `LDFLAGS` via environment. Used when you need to force-link a library
that the build system doesn't know about.

```jinja2
lib/shim/dll(dll_name=m)
```

### Other shims

| Shim | Purpose |
|------|---------|
| `lib/shim/x11` | Stub X11/Xcursor headers + fake libs for Wayland-only builds |
| `lib/shim/systemd` | Stub `sd-login.h` with no-op defines |
| `lib/shim/gnu` | glibc-isms (`error()`, `qsort_r`, etc.) for musl |
| `lib/shim/utmp` | Stub `login()` for musl |
| `lib/shim/egl` | Custom `eglplatform.h` |

### When to use shims vs other approaches

| Problem | Solution | Not this |
|---------|----------|----------|
| `-lfoo` fails, real symbols in another lib | `lib/shim/fake(lib_name=foo)` | `sed` to remove `-lfoo` from Makefile |
| `#include <old/path.h>` wrong path | `lib/shim/redir(from=old/path.h,to=new/path.h)` | `sed` on source files |
| `pkg-config --cflags foo` fails | `lib/shim/fake/pkg(pkg_name=foo,...)` | Patching configure scripts |
| Missing preprocessor define | `cpp_defines` block (§19) | `sed` on Makefile CFLAGS |

---

## 21. Content Addressing and UIDs

Every package gets a UID: a base-62-encoded hash of all its inputs — source URL, dependencies,
flags, build script, and the UID of every dependency. This means:

- Changing **anything** (version, a dep, a flag) produces a new UID and a new store path
- Two packages with the same inputs always have the same UID — results can be reused
- The store path is `/ix/store/<uid>-<canonical-name>/`
- Old versions are kept until GC: `./ix gc`

UIDs cascade: changing a library's version changes the UID of every package that depends
on it, all the way up the dependency tree.

`{{uniq_id}}` is available in templates — use it to namespace install paths and avoid
collisions between multiple versions of the same package installed simultaneously:

```jinja2
{% block make_flags %}
gitexecdir=bin/{{uniq_id}}
{% endblock %}
```

---

## 22. Complete Examples

### C library with Autotools (`lib/mylib/ix.sh`)

```jinja2
{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
mylib
{% endblock %}

{% block version %}
2.1.0
{% endblock %}

{% block fetch %}
https://example.com/mylib-{{self.version().strip()}}.tar.gz
0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
{% endblock %}

{% block bld_tool %}
bld/bison
{{super()}}
{% endblock %}

{% block lib_deps %}
lib/z
{% endblock %}

{% block configure_flags %}
--enable-static
--disable-shared
--without-tests
--with-zlib
{% endblock %}
```

### C binary with CMake (`bin/mytool/ix.sh`)

```jinja2
{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
mytool
{% endblock %}

{% block version %}
3.0.1
{% endblock %}

{% block git_repo %}
https://github.com/author/mytool
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
fedcba9876543210fedcba9876543210fedcba9876543210fedcba9876543210
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/openssl
lib/z
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{{super()}}
{% endblock %}

{% block cmake_flags %}
BUILD_TESTING=OFF
WITH_OPENSSL=ON
WITH_ZLIB=ON
{% endblock %}
```

### C binary with Meson (`bin/dinit/ix.sh`) — real example

```jinja2
{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/davmac314/dinit
{% endblock %}

{% block pkg_name %}
dinit
{% endblock %}

{% block version %}
0.19.4
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
d17c1e9630ce2de65135f2772193d73195b2b3e263d8d070f500258feaef515c
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/m4
{% endblock %}

{% block meson_flags %}
dinit-sbindir=${out}/bin
dinit-control-socket-path=/var/run/dinit/ctl
{% endblock %}
```

### Rust binary (`bin/bindgen/ix.sh`)

```jinja2
{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
rust-bindgen
{% endblock %}

{% block version %}
0.71.1
{% endblock %}

{% block cargo_url %}
https://github.com/rust-lang/rust-bindgen/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
4e58f7ed07ce1aff1a35e2749c42642b8e594196a9ff2ac7b8b8e1e14deddf8c
{% endblock %}

{% block bld_libs %}
lib/z
lib/llvm/19
{% endblock %}

{% block cargo_features %}
static
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/rust/helpers/patch/bindgen
{% endblock %}

{% block patch %}
{{super()}}
ln -s vendored/clang-sys ./
patch_bindgen .
{% endblock %}

{% block cargo_bins %}
bindgen
{% endblock %}
```

### Go binary (`bin/git/lfs/ix.sh`) — real example

```jinja2
{% extends '//die/go/build.sh' %}

{% block pkg_name %}
git-lfs
{% endblock %}

{% block version %}
3.6.1
{% endblock %}

{% block go_url %}
https://github.com/git-lfs/git-lfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2a1f031b45960621119c571c4e82b2418567e7ebdd45514f6dded55e615312b3
{% endblock %}

{% block go_bins %}
git-lfs
{% endblock %}
```

### Meta-package (`bin/git/ix.sh`) — real example

```jinja2
{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/git/cred
bin/git/unwrap
bin/openssh/client
{% endblock %}
```

### Parametrized meta-package (`lib/z/ix.sh`) — real example

```jinja2
{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/z/{{zlib_ver or ('ng' if x86_64 else 'adler')}}
{% endblock %}
```

### Generated config package (`etc/zram/t/ix.sh`) — real example

```jinja2
{% extends '//die/gen.sh' %}

{% set num %}{% block num %}{% endblock %}{% endset %}

{% block install %}
mkdir -p ${out}/etc/runit/1.d; cd ${out}/etc/runit/1.d

cat << EOF > 01-zram{{num}}.sh
# enable swap on zram{{num}}
echo '{{zram_size or 2048}}M' > /sys/block/zram{{num}}/disksize
mkswap /dev/zram{{num}}
swapon /dev/zram{{num}}
EOF
{% endblock %}
```

Instances at `etc/zram/0/ix.sh` and `etc/zram/1/ix.sh` just extend the template and set `num`:

```jinja2
{% extends '//etc/zram/t/ix.sh' %}
{% block num %}0{% endblock %}
```

### Package set (`set/fs/ix.sh`) — real example

```jinja2
{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mdadm
bin/parted
bin/xfsprogs
bin/gptfdisk
bin/e2fsprogs
bin/dosfstools
bin/btrfs/progs
{% endblock %}
```

---

## 23. Common Pitfalls

### Missing `lib/c` in `bld_libs`

Every C or C++ package needs `lib/c` (and `lib/c++` for C++). Without it the linker
cannot find `libc.a` and you get undefined reference errors at link time.

### Hardcoding paths

Never write `/usr`, `/lib`, `/include` in a package. All paths must go through `${out}`,
`${IX_T_DIR}`, or `${IX_B_DIR}`. CMake and Ninja templates already sanitise their build
files to replace `/usr` paths with `/nowhere`.

### `.pc` files in `bin` packages

pkg-config files (`.pc`) in `bin` packages must not reference library paths that other
packages would need. If your binary install puts a `.pc` in `${out}/lib/pkgconfig`, add:

```jinja2
{% block strip_pc %}
find ${out}/ -name '*.pc' -delete
{% endblock %}
```

### Shared libraries

ix defaults to static linking. The CMake and autoconf templates patch `SHARED` → `STATIC`
and pass `--disable-shared`. If a package genuinely requires shared linking (e.g., a
plugin system), use `wrap_cc` and the `dl/` template family — see `pkgs/die/dl/`.

### Symbol conflicts across static libraries

If two static libraries define the same symbol (e.g., both bundle `getopt`), use
`c_rename_symbol` to prefix the symbol with the package's `uniq_id`:

```jinja2
{% block c_rename_symbol %}
getopt
getopt_long
{% endblock %}
```

### `help` flag for discovery

During development, add `--help` as a flag to print all available options and exit:

- CMake: `cmake -LA` output filtered of `CMAKE_` variables
- autoconf: `./configure --help`
- Cargo: `cargo whatfeatures --offline .` (requires `bin/cargo/whatfeatures` in env)

```sh
./ix build bin/mypkg --help
```

### Template path resolution

- `//die/c/cmake.sh` — absolute from `pkgs/` root (`//` = `pkgs/`)
- `t/ix.sh` — relative to the current package directory
- `//etc/zram/t/ix.sh` — absolute from `pkgs/` root, pointing to another package's template

Local relative templates (`t/ix.sh`) are useful for sharing a base template among several
versioned sub-packages (e.g., `lib/openssl/3/`, `lib/openssl/1/` both extend `t/ix.sh`
which lives at `lib/openssl/t/ix.sh`).

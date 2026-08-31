<picture>
<source media="(prefers-color-scheme: dark)" srcset="https://github.com/stal-ix/stal-ix.github.io/blob/main/images/ixpm_02.png" width="250px" height="94px">
<source media="(prefers-color-scheme: light)" srcset="https://github.com/stal-ix/stal-ix.github.io/blob/main/images/ixpm_01.png" width="250px" height="94px">
<img alt="logo" src="https://raw.githubusercontent.com/stal-ix/stal-ix.github.io/main/images/ixpm_01.png" width="250px" height="94px">
</picture>
<a href="https://repology.org/repository/stalix">
    <img src="https://repology.org/badge/repository-big/stalix_dev.svg" alt="Repository status">
</a>
<br>
<br>

# stal/ix

**stal/ix** is a Linux distribution (**Stalix**) built around a custom, source-based package/build system (**IX**).

This repository documents and hosts the tooling and package set used to build a complete OS image, while the core idea is the same everywhere:

- treat “the OS” as a **content-addressed store** of build artifacts  
- keep builds **deterministic and debuggable**
- make it possible to build large systems without turning the build language into a Turing-complete nightmare
- minimize “runtime surprises” (dynamic loader, random `.so`/plugins, SUID binaries, etc.)

> If you are looking for “another distro”, Stalix is closer to “a laboratory for building a *correct* Linux” than a mainstream desktop distribution.

## Projects

### 1) IX — the package manager / build system

IX is a package manager in the “Nix/Guix family”, but with different trade-offs:

- **Content-addressed store** (think `/ix/store/...`) with immutable build outputs.
- **Source-first**: packages are built from sources using explicit recipes.
- **Non–Turing-complete(ish) package definitions**: the system is designed so that describing packages doesn’t turn dependency resolution/build planning into an unbounded computation.
- **Templated package recipes**: packages are generated from templates (Jinja-style), which makes “do the same, but with a tiny change” actually practical.
- **Hermetic builds / isolation**: build steps are intended to run in an isolated environment (no “oops, my build tool touched `/bin` on the host”).
- **Cross-target support** (work in progress, but used in practice): build artifacts can target other OS/ABIs.
- **Aggressive focus on static linking** and reproducibility where it makes sense for the system.

Typical concepts you will see:

- `/ix/store/<hash>-<pkg>` — immutable outputs
- “realms” / “system realm” — an assembled environment composed from store entries
- wrappers around toolchains/linkers to enforce policies and reduce per-package boilerplate

### 2) Stalix — a distro built on IX

Stalix is “what happens when IX builds the whole OS”.

Core ideas:

- **No systemd**.
- **No SUID binaries by default** (security model is built to avoid the classic “SUID + plugins = boom” story).
- **A minimal, explicit userspace**: fewer implicit runtime dependencies, fewer “magic” daemons.
- A strong preference for **static binaries** and **explicit composition** over “shared library soup”.
- A “build it like you mean it” approach: toolchain updates, graphics stack experiments, hermetic build fixes, etc. are treated as first-class engineering work.

Stalix is also published to external indexes (e.g. Repology) to make package freshness visible and to enable automated update workflows.

## Why does this exist?

Because the typical Linux distro model tends to accumulate properties that are hard to reason about:

- dynamic linking everywhere (ABI constraints, loader complexity, startup overhead, dependency fragility)
- plugins loaded from the filesystem at runtime
- build systems that assume `host == target`
- “supply chain by default” (random prebuilt blobs inside source trees)
- implicit host environment leakage into builds

IX/Stalix is an attempt to push in the opposite direction: **make the system boring and explicit**.

## Repository layout (high level)

This repo typically contains:

- the IX entrypoint and supporting tools (executors, wrappers, helpers)
- the package set (“ports tree”)
- distro assembly logic (images/rootfs, init, base system composition)
- CI helpers and metadata dumps (e.g. for Repology)

Exact layout evolves; use the top-level directories as the source of truth.

## Getting started

### Build a package

Examples from real usage:

```sh
# Build a single package
./ix build bin/b64

# Continue independent graph branches after a build failure
IX_KEEP_GOING=yes ./ix build set/ci

# Cross-target build example
./ix build bin/b64 --target=freebsd-x86_64
```

### Mutate / assemble the system realm

```sh
# Apply system composition changes (think “assemble/refresh the system realm”)
./ix mut system
```

### Run a tool from the store (convenience)

```sh
# Resolve a binary name to the package and run it
./ix run zstd --help
```

> Notes:
> - The exact CLI and the available targets/features depend on the current state of the repo.
> - This project is intentionally not “one command to install on any machine”. It’s a build system and a distro lab.

## Security model (high-level)

Stalix tries to avoid entire classes of problems instead of “patching around them”:

- avoid SUID binaries where possible
- avoid loading untrusted native code at runtime (classic .so plugin model)
- prefer hermetic builds and explicit inputs
- make “what is in the system” auditable via the store and build graph

This does not magically make the system secure. It’s a set of engineering choices that try to reduce attack surface and reduce complexity.

## Contributing

Contributions are welcome, especially in areas that scale poorly for a single maintainer:

- package updates and fixes
- build isolation fixes (removing implicit host dependencies)
- bootstrap work (reducing circular toolchain requirements)
- CI improvements and reproducibility checks
- documentation (yes, really)

If you send PRs:

- keep changes minimal and scoped
- include rationale (what broke, why this fixes it)
- prefer deterministic fixes over “works on my machine”

## Status / disclaimer
This is an active engineering project, not a polished consumer OS.

Expect:

- breakage during large toolchain transitions
- experiments (graphics stack, init, build isolation)
- non-mainstream decisions (by design)

If you want a stable, boring workstation today — use a mainstream distro.
If you want to explore how a “correct-by-construction-ish” Linux could be built — welcome.

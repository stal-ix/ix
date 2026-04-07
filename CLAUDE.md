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

---

# Package update procedure

## General

- Build output goes through the `assemble` subprocess. Use `>/path/to/log 2>&1` to capture it — output can be large.
- Builds from scratch can be very slow (compiling toolchains like cargo/rust/go from source). Always wait for the build to finish — do not interrupt or timeout.
- When checking GitHub tags, use `git ls-remote --tags <repo>` to verify exact tag names (e.g. `2` vs `v2`).
- Refer to `PKGS.md` for full package development documentation (template hierarchy, blocks, etc.).

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

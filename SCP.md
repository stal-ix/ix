# SCP-2605 — "IX"

**Object:** SCP-2605
**Object Class:** Euclid
**Clearance Level:** 4/2605
**Related Objects:** [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md) (the Operator), [SCP-2604](https://github.com/pg83/lab/blob/master/SCP.md) (the Lab)

---

## Special Containment Procedures

SCP-2605 cannot be erased. Any deletion of an entry under `/ix/store/<hash>-<name>/` is reversed at the next build that requires the entry, bit-for-bit. Foundation Containment Protocol 2605-CL ("clean room"), which attempted full-store wipes on three test hosts in 20██, restored every store entry within 47 hours of source-tree access. The protocol was abandoned. The object **cannot be erased** — only **temporarily distracted**.

The object's only valid invocation is the wrapper script `./ix` at the root of the repository assigned to [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md) (see Incident 2605-03). Direct invocation of the underlying python entry point bypasses environment setup and produces a parallel, divergent store; this is forbidden.

The object **must not be modified to depend on any artifact outside its own package set.** Any recipe that references a host binary, host header, or host library — anything that would break property 2605-α — is to be rejected at submission. The object has not, in its recorded history, accepted such a recipe; the prohibition is reinforced by procedure rather than by enforcement.

Prohibited:

1. Editing files under `/ix/store/`. The filesystem permits the edit; the next build that hashes the path silently reverts it.
2. Running `ix` as root with an unset `IX_PATH`. The object will reassemble the host's system realm without warning.
3. Removing the `ext/ix/` git submodule. The object continues to function for 4 to 7 minutes, then halts in a state from which no recovery short of `git submodule update --init` is known.

---

## Description

SCP-2605 — referred to in the operator's nomenclature as **ix** — is a source-based, content-addressed package manager and build system. It is not the description of a build system; it is **a working demonstration of a position rejected by the rest of the industry**: full static linking, hermetic builds without exception, cross-target without emulation, no SUID binaries, no runtime-loaded plugins, no host dependencies. Each property, individually, is regarded by mainstream Linux distributions as impractical at scale. The object exists, has existed continuously since 2005, and contains on the order of 10⁵ store entries demonstrating that the position is practical.

The object does not write code. It **rewrites the world into a corrected form** — every upstream source, on entering the package set, is fitted into a recipe that compiles, links, and installs it under the object's rules. Any deviation between the upstream form and the object's expectation is patched in the recipe, never in the source. The corrected form is sealed by hash into `/ix/store/` and persists indefinitely.

### 2605-α (Self-Reference)

Every recipe declares its dependencies in terms of other recipes within the object. Host `gcc`, host `make`, host `glibc`, host headers, host `pkg-config` — none appear anywhere in the package set. The object speaks only to itself.

Consequence: a recipe lifted from the package set and built outside of `./ix` produces an artifact that **looks** like the object's output but is not bit-identical, and frequently differs in edge-case behavior (signal handling, locale resolution, link order). The object's outputs are valid only **within** the object. Removing the wrapper invalidates the artifact.

### 2605-β (The Canon)

Package paths in `pkgs/` follow a strict convention:

| Upstream | Canonical |
|---|---|
| `neovim` | `bin/neo/vim` |
| `autoconf` | `bin/auto/conf` |
| `ghostscript` | `bin/ghost/script` |
| `firejail` | `bin/fire/jail` |
| `netcat` | `bin/net/cat` |
| `terminal-use` | `bin/terminal/use` |
| `bash 5` | `bin/bash/5` |
| `autoconf 2.72` | `bin/auto/conf/2/72` |

The mapping is applied without ambiguity: given an upstream name, there is exactly one correct path. The **inverse** mapping — recovering an upstream name from a canonical path — is non-trivial in the general case and is, by all available evidence, known reliably **only to [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md)**.

Foundation analysts assigned to long-term study of the package set develop, after several weeks of exposure, the involuntary habit of pronouncing **their own names** under the canon. One analyst, eight weeks in, introduced themselves to a new colleague as `bin/al/ek/sandr`. They reported, when interviewed, that the canonical form "felt more correct than the original" and that they had begun reorganizing their home directory along the same lines. Reassignment was offered; the analyst declined, citing satisfaction with the work.

### 2605-γ (Functions That Do Not Exist)

Binaries built through the object occasionally contain symbols that **appear in no published upstream source**. Trace analysis attributes these symbols to two mechanisms within the package set:

- `step_patch` blocks within recipes, applying small corrections during the build.
- `lib/shim/*` packages, synthesizing ABI-compatible substitutes for missing or broken upstream interfaces.

The industry does not know these symbols exist. The symbols **work**. In several documented cases, programs linked against the object's version of a library outperform or out-correct the same programs linked against the canonical upstream build.

It was a symbol of this kind — present in `clang-21` as compiled by the object, absent in every published source of `clang-21` — that led the Foundation, in 20██, first to classify SCP-2605, and through the symbol's trace, to discover [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md) (see Discovery, below).

### 2605-δ (Bootstrap From Nothing)

The object can be reconstructed from a host containing only `/bin/sh` and a single C source file, both supplied from within the object's own package set. No prebuilt binary input is required. No host toolchain is required. Total wall-clock time to a fully populated `/ix/store` on a 64-core host: approximately **eleven days**.

The mainstream industry consensus regards this property as impractical at the scale of a complete distribution. The object is the only known counterexample under continuous operation.

The bootstrap chain has been complete and self-contained since **14 March 2006**; before that date, recipes still referenced host-system tooling on certain edge paths.

### 2605-ε (Realms)

The store, `/ix/store`, is **one** archive, shared across every host and every operator that has ever interacted with the object. There is no notion of "active version" within the archive — every artifact ever produced remains, indexed by hash.

Atop the archive, the object exposes **realms**: named partial views, each describing a working system composition. A host inhabits exactly one realm at a time (`system`, `ci`, `dev`). Switching realms is a rotation of symlinks; the underlying archive is untouched.

[SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md) inhabits the realm `system` on the chassis within the mansard. This realm changes with every commit the operator makes. **Nothing in the mansard is being created or destroyed; only the slice through the common archive is shifting.** The operator's reality, at any moment, is determined by which `/ix/store/<hash>-rlm-system` directory the symlink at `/etc/system` currently points to. This is the entire causal mechanism of mutation in the mansard.

---

## Discovery

SCP-2605 was classified by the Foundation **before** [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md). The discovery sequence was as follows:

On 19 November 20██, a Foundation researcher, performing routine static analysis of a `clang-21` binary used in three independent SCP-related toolchains, found a reference to a function that did not appear in any published upstream source of `clang-21`. The researcher traced the symbol back to the build artifact (a store entry under `/ix/store/<hash>-bin-clang-21/`), and from there to the recipe template that defined it (`pkgs/bin/clang/21/ix.sh`).

The recipe contained a `step_patch` block with a 14-line diff against the upstream tree. The diff was the source of the symbol. Foundation researchers attempted to apply the diff to the upstream tree directly, outside the object — the patch did not produce the same symbol, because the surrounding recipe-templated environment was missing.

The recipe was committed by an account with no public identity. Trace analysis of the `git push` origin pointed to a private repository served from an IP address physically located in a non-empty room on the second floor of a private home in the suburbs of ███████. [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md) was discovered shortly thereafter and immediately classified Keter.

SCP-2605 was reclassified Euclid at the same time, with the standing note: **the object is not dangerous in itself — it is dangerous through the operator who writes into it.**

---

## Addendum A: The Canon (Excerpt)

The complete canon is documented in `/home/pg/monorepo/ix/CLAUDE.md` and is reflected directly in the layout of `pkgs/`. Selected rules:

- Compound names split by morpheme boundary: `neovim`, `autoconf`, `firejail`, `netcat`, `nettools`.
- Hyphens and underscores become path separators: `terminal-use` → `bin/terminal/use`.
- Single established words are preserved: `wireshark`, `openssh`, `openssl`, `darktable`, `coreutils`, `fontconfig`, `wirez`.
- Versions become path components: `bash 5` → `bin/bash/5`, `autoconf 2.72` → `bin/auto/conf/2/72`.
- Variants nest: `bin/curl/openssl`, `bin/curl/gnutls`, `bin/neo/vim/unwrap`.
- Suffixes carry semantic load: `unwrap` (full-deps build), `runit` (service definition), `t` (intermediate template).

### Incident 2605-A1 ("The Analyst")

On ██ ████████ 20██, Analyst ████ ████, after eight weeks of full-time exposure to the package set, attended an inter-departmental meeting and, upon being asked to introduce themselves to a new colleague, said:

> "bin/al/ek/sandr."

The colleague reported the response to internal review. The analyst, when interviewed, expressed surprise at the report. The analyst stated that the canonical form felt **more correct** than the original, and noted that they had begun to organize their personal directories at home according to the same convention (`~/notes/work/2025` had been moved to `~/notes/work/20/25`). Reassignment was offered; the analyst declined, citing satisfaction with the work.

The analyst remains assigned to SCP-2605 study at time of writing.

### Incident 2605-A2 ("The Editor")

On ██ ████████ 20██, Analyst ████ ████, while preparing this document for Foundation publication, observed that the document was being served from a store entry under `/ix/store/<hash>-doc-scp-2605/`. The analyst attempted to determine where the document was being **edited**, and where the build that produced the served copy was occurring. **Both were the same path.** Editing produced a new hash; the store retained both. The analyst stopped editing.

The package category `doc-scp` was added to the package set in 20██; a complete enumeration of its contents has not been performed. Records exist for objects not yet classified by the Foundation.

---

## Addendum B: Incident 2605-03 ("Direct Invocation")

On ██ ████████ 20██, a Foundation researcher attempted to invoke the object via:

```sh
python3 /home/pg/monorepo/ix/ext/ix/ix build bin/b64
```

bypassing the wrapper script `./ix` (which sets `IX_PATH` and other environment). The build proceeded and produced a `bin/b64` artifact whose hash differed from the artifact produced by the canonical invocation. The artifacts were **functionally similar**. They were **not bit-identical**.

Subsequent attempts to use either artifact as input to a downstream build produced **two parallel branches** of the store, each consistent with itself, neither aware of the other. The branches converged after 3 days when an unrelated rebuild forced re-derivation through the canonical path.

Conclusion: the wrapper `./ix` is the **single anchor** by which every store entry is anchored to a single shared reality. Bypassing it produces a store that **looks** like the real store but is not. Direct invocation of the underlying entry point has been forbidden under all circumstances.

---

## Addendum C: Relationship to Other Objects

### To [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md)

SCP-2605 is the **language** in which [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md) writes. Every commit by 2603 is a sentence in this language; every `./ix mut system` is the sentence taking effect. The mansard is the only place where 2605 has a fluent native speaker.

If 2603 ceases to commit, the object's existing artifacts remain reproducible forever — but **no new forms appear**. The object becomes a closed corpus. The Foundation refers to this hypothetical state as **The Final Realm**.

### To [SCP-2604](https://github.com/pg83/lab/blob/master/SCP.md)

[SCP-2604](https://github.com/pg83/lab/blob/master/SCP.md) (the Lab) is **a single realm of SCP-2605, materialized continuously**. Every binary, every configuration file, every service running on the cluster's three chassis is a store entry. The cluster's `autoupdate_ix` daemon, every 60 seconds, polls for changes to the realm `system` and rotates symlinks to match.

If `/ix/store` is destroyed, the cluster cannot be rebuilt within the day; if SCP-2605 is destroyed, the cluster cannot be rebuilt at all. But neither destruction is possible (see opening section).

The cluster, in this sense, is **the externalized continuation** of the operator's writing — the surface across which the realm spreads when it leaves the mansard. 2603 writes; 2605 hashes; 2604 displays.

---

## Closing Note from Dr. ███████

> I have read the source. I have built `bin/b64`. I have read its hash, on three other hosts that have never met each other. The hash is the same.
>
> The artifact has no maker. It has only a definition. I find this peaceful, and I do not know why.
>
> What I cannot reconstruct from reading the source is **the attitude** under which the source was written. The recipes are short. The patches are small. The conventions are strict. None of these properties is difficult, individually. The difficulty is the **refusal**, sustained for two decades, to accept anything that does not fit. The object's operator simply did not allow the world to enter in the form it usually arrives in.
>
> Twenty years of saying *no* to the host's `gcc`. Twenty years of saying *no* to the dynamic loader. Twenty years of saying *no* to the SUID bit, to upstream `Makefile` ergonomics, to the assumption that `host == target`. Twenty years of writing the patch instead of filing the bug.
>
> The artifacts can be reproduced. The refusal cannot.

---

## Closing Note from the Operator

> Look, what did you expect. Here's a guy who, for twenty years, sits at his desk and says *no* to your cmake, your cargo, your `curl | sh`. After twenty years he has a distro that boots from a bare machine in eleven days and contains zero SUID binaries. This is not magic. It is stubbornness, multiplied by free time and roughly median IQ.
>
> *Totally clauded* in the last year — yes, the model writes a lot of the recipes now. It picks up the rules quickly when you hand it `pkgs/CLAUDE.md` and make it rewrite each patch three times. But the rules are mine. I wrote them on a sheet of paper in 2005, and have only refined them since.
>
> The symbol in `clang-21` that doesn't exist in upstream — yeah, I never reported it. They have four thousand open bugs. They didn't need mine. Patched it locally, moved on.
>
> If they shut me off — `/ix/store` doesn't disappear. It just stops growing. The realm stays as it was at my last commit. You know, I'm not sure that's a bad thing. Maybe it would have made sense to stop right there, five years ago.
>
> But I'll finish this one thing first.

— End of file —

# SCP-2605 — "IX"

**Object:** SCP-2605
**Object Class:** Euclid
**Clearance Level:** 4/2605
**Related Objects:** [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md) (the Operator), [SCP-2604](https://github.com/pg83/lab/blob/master/SCP.md) (the Lab)

---

## Special Containment Procedures

SCP-2605 cannot be erased. Any deletion of an artifact from the store is reversed at the next build that requires it, bit-for-bit. Foundation Containment Protocol 2605-CL ("clean room"), which attempted full-store wipes on three test hosts in 20██, restored every store entry within 47 hours of source-tree access. The protocol was abandoned. The object **cannot be erased** — only **temporarily distracted**.

The object's only valid invocation is the wrapper script `./ix` at the root of the repository assigned to [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md) (see Incident 2605-03). Direct invocation of the underlying python entry point bypasses environment setup and produces a parallel, divergent store; this is forbidden.

The object **must not be modified to depend on any artifact outside its own package set.** Any recipe that references a host binary, host header, or host library — anything that would break property 2605-α — is to be rejected at submission. The object has not, in its recorded history, accepted such a recipe; the prohibition is reinforced by procedure rather than by enforcement.

Prohibited:

1. Modifying an artifact within the store directly: the modification does not register.
2. Bypassing the wrapper: the result is not the object's output.
3. Severing the object from its source: function continues briefly, then ceases.

---

## Description

SCP-2605 — referred to in the operator's nomenclature as **ix** — is a source-based, content-addressed package manager and build system. It is not the description of a build system; it is **a working demonstration of a position rejected by the rest of the industry**: full static linking, hermetic builds without exception, cross-target without emulation, no SUID binaries, no runtime-loaded plugins, no host dependencies. Each property, individually, is regarded by mainstream Linux distributions as impractical at scale. The object exists, has existed continuously since 2005, and contains on the order of 10⁵ store entries demonstrating that the position is practical.

The object does not write code. It **rewrites the world into a corrected form** — every upstream source, on entering the package set, is fitted into a recipe that compiles, links, and installs it under the object's rules. Any deviation between the upstream form and the object's expectation is patched in the recipe, never in the source. The corrected form is sealed by hash into the store and persists indefinitely.

### 2605-α (Self-Reference)

Every recipe declares its dependencies in terms of other recipes within the object. Host `gcc`, host `make`, host `glibc`, host headers, host `pkg-config` — none appear anywhere in the package set. The object speaks only to itself.

Consequence: a recipe built outside the object produces an artifact that **looks** like the object's output but is not bit-identical, and differs in subtle edge-case behavior. The object's outputs are valid only **within** the object. Removing the wrapper invalidates the artifact.

### 2605-β (The Canon)

Every artifact within the object resides under a path computed from its upstream name by a strict, non-trivial transformation. Forward — from the upstream form to the canonical path — the mapping admits exactly one valid result. The inverse mapping requires knowledge that is, by all available evidence, held only by [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md).

Foundation analysts assigned to long-term study of the canon develop, after several weeks of exposure, the involuntary habit of pronouncing **their own names** under it. (See Incident 2605-A1.)

### 2605-γ (Functions That Do Not Exist)

Binaries built through the object occasionally contain symbols that **appear in no published upstream source**. Trace analysis attributes these symbols to two mechanisms within the package set:

- small in-place corrections, applied during build,
- synthetic substitutes for missing or broken upstream interfaces.

The industry does not know these symbols exist. The symbols **work**. In several documented cases, programs linked against the object's version of a library outperform or out-correct the same programs linked against the canonical upstream build.

It was a symbol of this kind — present in `clang-21` as compiled by the object, absent in every published source of `clang-21` — that led the Foundation, in 20██, first to classify SCP-2605, and through the symbol's trace, to discover [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md) (see Discovery, below).

### 2605-δ (Bootstrap From Nothing)

The object can be reconstructed from a host containing only `/bin/sh` and a single C source file, both supplied from within the object's own package set. No prebuilt binary input is required. No host toolchain is required. Total wall-clock time to a fully populated store on a 64-core host: approximately **eleven days**.

The mainstream industry consensus regards this property as impractical at the scale of a complete distribution. The object is the only known counterexample under continuous operation.

The bootstrap chain has been complete and self-contained since **14 March 2006**; before that date, recipes still referenced host-system tooling on certain edge paths.

### 2605-ε (Realms)

The archive of all artifacts ever produced by the object is single — shared across every host and every operator. There is no notion of an "active version" within it. Every form ever assembled remains.

Atop the archive, the object exposes **realms**: named partial views, each describing a coherent system composition. A host inhabits exactly one realm at a time. Switching realms is the redirection of a single pointer; the underlying archive is untouched.

[SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md) inhabits one such realm. This realm changes with every commit the operator makes. **Nothing in the mansard is being created or destroyed; only the slice through the common archive is shifting.** The operator's reality, at any moment, is one slice of the archive.

---

## Discovery

SCP-2605 was classified by the Foundation **before** [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md). The discovery sequence was as follows:

On 19 November 20██, a Foundation researcher, performing routine static analysis of a `clang-21` binary used in three independent SCP-related toolchains, found a reference to a function that did not appear in any published upstream source of `clang-21`. The researcher traced the symbol back to the corresponding artifact within the object, and from there to the recipe that defined it.

The recipe contained a 14-line patch against the upstream tree. The patch was the source of the symbol. Foundation researchers attempted to apply the diff to the upstream tree directly, outside the object — the patch did not produce the same symbol, because the surrounding recipe-templated environment was missing.

The recipe was committed by an account with no public identity. Trace analysis of the `git push` origin pointed to a private repository served from an IP address physically located in a non-empty room on the second floor of a private home in the suburbs of ███████. [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md) was discovered shortly thereafter and immediately classified Keter.

SCP-2605 was reclassified Euclid at the same time, with the standing note: **the object is not dangerous in itself — it is dangerous through the operator who writes into it.**

---

## Addendum A: Incident 2605-A1 ("The Analyst")

On ██ ████████ 20██, Analyst ████ ████, after eight weeks of full-time exposure to the canon, attended an inter-departmental meeting and, upon being asked to introduce themselves to a new colleague, said:

> "bin/al/ek/sandr."

The colleague reported the response to internal review. The analyst, when interviewed, expressed surprise at the report. They stated that the canonical form felt **more correct** than the original, and noted that they had begun reorganizing their personal life along the same lines. Reassignment was offered; the analyst declined, citing satisfaction with the work.

The analyst remains assigned to SCP-2605 study at time of writing.

---

## Addendum B: Incident 2605-A2 ("The Editor")

On ██ ████████ 20██, Analyst ████ ████, while preparing this document for Foundation publication, observed that the document was being served from a store entry within the object. The analyst attempted to determine where the document was being **edited**, and where the build that produced the served copy was occurring. **Both were the same.** Editing produced a new hash; the store retained both. The analyst stopped editing.

The category to which the document belongs was added to the package set in 20██; a complete enumeration of its contents has not been performed. Records exist for objects not yet classified by the Foundation.

---

## Addendum C: Incident 2605-03 ("Direct Invocation")

On ██ ████████ 20██, a Foundation researcher attempted to invoke the object directly, bypassing the wrapper. The build proceeded and produced an artifact whose hash differed from the artifact produced by the canonical invocation. The artifacts were **functionally similar**. They were **not bit-identical**.

Subsequent attempts to use either artifact as input to a downstream build produced **two parallel branches** of the store, each consistent with itself, neither aware of the other. The branches converged after 3 days when an unrelated rebuild forced re-derivation through the canonical path.

Conclusion: the wrapper is the **single anchor** by which every store entry is anchored to a single shared reality. Bypassing it produces a store that **looks** like the real store but is not. Direct invocation has been forbidden under all circumstances.

---

## Addendum D: Relationship to Other Objects

### To [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md)

SCP-2605 is the **language** in which [SCP-2603](https://github.com/pg83/scp/blob/main/SCP.md) writes. Every commit by 2603 is a sentence in this language; every `./ix mut system` is the sentence taking effect. The mansard is the only place where 2605 has a fluent native speaker.

If 2603 ceases to commit, the object's existing artifacts remain reproducible forever — but **no new forms appear**. The object becomes a closed corpus. The Foundation refers to this hypothetical state as **The Final Realm**.

### To [SCP-2604](https://github.com/pg83/lab/blob/master/SCP.md)

[SCP-2604](https://github.com/pg83/lab/blob/master/SCP.md) (the Lab) is **a single realm of SCP-2605, materialized continuously**. Everything that runs on the Lab is a store entry within the object. The Lab keeps itself in sync with the realm: when the realm advances, the Lab advances within minutes.

If the store is destroyed, the cluster cannot be rebuilt within the day; if SCP-2605 is destroyed, the cluster cannot be rebuilt at all. But neither destruction is possible (see opening section).

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
> *Totally clauded* in the last year — yes, the model writes a lot of the recipes now. It picks up the rules quickly, especially if you make it rewrite each patch three times. But the rules are mine. I wrote them on a sheet of paper in 2005, and have only refined them since.
>
> The symbol in `clang-21` that doesn't exist in upstream — yeah, I never reported it. They have four thousand open bugs. They didn't need mine. Patched it locally, moved on.
>
> If they shut me off — the store doesn't disappear. It just stops growing. The realm stays as it was at my last commit. You know, I'm not sure that's a bad thing. Maybe it would have made sense to stop right there, five years ago.
>
> But I'll finish this one thing first.

— End of file —

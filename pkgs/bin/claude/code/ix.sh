{# claude as a single file: the stub built next door, with the upstream
   binary appended to it. No PT_INTERP rewriting and no LD_LIBRARY_PATH —
   the stub stays the process's main executable, which is what keeps solo's
   static TLS pad in place for the guest's own thread-local storage.

   The stub arrives through lib_deps rather than bld_tool because only that
   path keeps the target: bld deps are built for the host. kind=bin on the
   reference overrides the kind=lib that lib_deps would otherwise impose,
   and libdlfcn_ver=elf rides down the whole closure so every lib/dlfcn in
   it resolves to solo's implementation rather than the default one. #}

{% extends '//die/gen.sh' %}

{% block pkg_name %}
claude-code
{% endblock %}

{% block version %}
2.1.280
{% endblock %}

{% block fetch %}
https://downloads.claude.ai/claude-code-releases/{{self.version().strip()}}/linux-x64/claude
1e08503dbdf3c2cb0d706d32f3408277388d1c76ef108673e8fe42c1b322925b
{% endblock %}

{% block lib_deps %}
bin/claude/code/stub(kind=bin,libdlfcn_ver=solo)
{% endblock %}

{% block bld_tool %}
bin/solo/pack
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
solo-pack --stub ${CLAUDE_SOLO_STUB} --program claude=${src}/claude --output ${out}/bin/claude.exe --check
{% endblock %}

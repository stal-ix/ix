{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/libbpf/bpftool
{% endblock %}

{% block git_branch %}
v7.4.0
{% endblock %}

{% block git_sha %}
30df20f4000f6a50fdc7316fca608cc92a9333986dbadeea5b76c019eac6d66a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/cap
lib/bpf
lib/bfd
lib/iberty
lib/opcodes
lib/llvm/18
{% endblock %}

{% block step_unpack %}
{{super()}}
cd src
{% endblock %}

{% block make_flags %}
LLVM=1
V=1
CLANG_BPF_CO_RE_PROBE_CMD='echo 1'
bash_compdir=${out}/share/bash
{% endblock %}

{% block cpp_defines %}
PACKAGE_VERSION=1
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}

{% block bld_tool %}
bld/llvm/config
{% endblock %}

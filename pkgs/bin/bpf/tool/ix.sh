{% extends '//die/c/make.sh' %}

{% block pkg_name %}
bpftool
{% endblock %}

{% block version %}
7.8.1
{% endblock %}

{% block git_repo %}
https://github.com/libbpf/bpftool
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
4f9560028c4caee4e588c9350f6cfd26f80ace45b4b9677e1e85bbc8258a39d9
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/cap
lib/bpf
lib/openssl
lib/bfd
lib/llvm
lib/iberty
lib/opcodes
lib/elfutils
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
CC=clang
CLANG='${FREESTANDING_CLANG} -D_inline=_inline_'
HOSTCC=cc
{% endblock %}

{% block cpp_defines %}
PACKAGE_VERSION=1
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}

{% block bld_tool %}
bld/pkg/config
bld/llvm/config
{% endblock %}

{% block env %}
export BPFTOOL=${out}/bin/bpftool
{% endblock %}

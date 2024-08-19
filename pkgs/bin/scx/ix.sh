{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/sched-ext/scx/archive/refs/tags/v1.0.2.tar.gz
sha:32087e9dfcc62169e2218bb77bc10b573858d393629bb8916740e002ded0bc38
{% endblock %}

{% block bld_tool %}
bin/jq
bld/make
bin/bpf/tool
bin/bpf/clang
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/bpf
lib/zstd
lib/kernel
lib/elfutils
lib/bsd/overlay
{% endblock %}

{% block meson_flags %}
libbpf_a=disabled
offline=true
bpf_clang=bpf_clang
bpftool=disabled
enable_rust=false
enable_stress=false
{% endblock %}

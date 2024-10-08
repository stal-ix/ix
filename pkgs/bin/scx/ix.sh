{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/sched-ext/scx/archive/refs/tags/v1.0.5.tar.gz
sha:0bf24244de51441a8f7ede0ffc0ee7275644c7a93ac6f6b691eee952d6744f9c
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

{% block patch %}
sed -e 's|.*subdir.*rust.*||' -i meson.build
{% endblock %}

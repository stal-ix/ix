{% extends '//die/c/meson.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
sha:190003a6aee834c14cd707b7a2c53b6723fd6521a18d898916c8f26872708ce5
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
bpftool=bpftool
enable_rust=false
enable_stress=false
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*rust.*||' -i meson.build
{% endblock %}

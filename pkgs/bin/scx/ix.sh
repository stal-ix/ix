{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/sched-ext/scx/archive/refs/tags/v1.0.4.tar.gz
sha:c6d76765cafca8c6146aca092e1dde0f8256c94e3f7fa7da86a3b37c84287efd
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

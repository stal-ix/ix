{% extends '//die/c/meson.sh' %}

{% include 'ver.sh' %}

{% block fetch %}
{{self.source_url().strip()}}
sha:7e357cec1855153fca0e48925210ca8d876dcba8c6a1a62139c429c024d49949
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

{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
bpftop
{% endblock %}

{% block version %}
0.6.0
{% endblock %}

{% block cargo_url %}
https://github.com/Netflix/bpftop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
6a51e18981b57a4e35b4a88d8155a6b8f25c2113eacff1865970fe78153866d3
{% endblock %}

{% block bld_libs %}
lib/z
lib/bpf
lib/kernel
lib/elfutils
{% endblock %}

{% block bld_tool %}
bin/bpf/clang
{% endblock %}

{% block patch %}
base64 -d << EOF > build.rs
{% include 'build.rs/base64' %}
EOF
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/bpftop ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}

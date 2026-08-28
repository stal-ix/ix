{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
bpftop
{% endblock %}

{% block version %}
0.9.0
{% endblock %}

{% block cargo_url %}
https://github.com/Netflix/bpftop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
e21d98a6a8c9550c5dd520d3c499f0e9ac712425ad05e6136d3d3d560f54fd4c
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

{% block cargo_bins %}
bpftop
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}

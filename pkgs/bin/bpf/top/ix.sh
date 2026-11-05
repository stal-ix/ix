{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
bpftop
{% endblock %}

{% block version %}
0.9.1
{% endblock %}

{% block cargo_url %}
https://github.com/Netflix/bpftop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
dd2f60f36260711d096b51fa02c498d668acd77005e9f3b57133dc516e8ff6bd
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

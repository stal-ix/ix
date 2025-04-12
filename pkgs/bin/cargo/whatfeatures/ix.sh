{% extends '//die/rust/cargo.sh' %}

{% block version %}
0.9.9
{% endblock %}

{% block cargo_url %}
https://github.com/museun/cargo-whatfeatures/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
307a2fcb6b36dab511ffbb18403f16c382e0529aec7188e07158b2e007fb7de5
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/cargo-whatfeatures ${out}/bin/
{% endblock %}

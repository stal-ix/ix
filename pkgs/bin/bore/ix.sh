{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
bore
{% endblock %}

{% block version %}
0.5.0
{% endblock %}

{% block cargo_url %}
https://github.com/ekzhang/bore/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
5afaad495162d5f82b095ca225ec845abb383248764c82976d74584119d96f99
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/bore ${out}/bin/
{% endblock %}

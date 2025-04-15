{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
bore
{% endblock %}

{% block version %}
0.5.3
{% endblock %}

{% block cargo_url %}
https://github.com/ekzhang/bore/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
3b997f5ad45f9536f8a6bfcf6c8f8de8cda2cd7f2d8191cdd9e4569bf534e9f4
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/bore ${out}/bin/
{% endblock %}

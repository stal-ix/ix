{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
bore
{% endblock %}

{% block version %}
0.5.2
{% endblock %}

{% block cargo_url %}
https://github.com/ekzhang/bore/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
da1368e0ea741c850de71f41af856761216cde8885400f8aa55e6ed24cc19df9
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/bore ${out}/bin/
{% endblock %}

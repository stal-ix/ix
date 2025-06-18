{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
just
{% endblock %}

{% block version %}
1.40.0
{% endblock %}

{% block cargo_url %}
https://github.com/casey/just/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
6f6dbbe0eea956f484afa8cf85fc51382c3c5d0d006b7a76c48a35d6fe7830dd
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/just ${out}/bin/
{% endblock %}

{% block cargo_tool %}
bld/cargo/86
{% endblock %}

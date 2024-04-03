{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v0.41.0.tar.gz
{% endblock %}

{% block cargo_sha %}
6ddef613c694cd5cfa83de63859be9b56c9c0849eca0ee91dfccc5e5e4f2d7b6
{% endblock %}

{% block unpack %}
{{super()}}
cd crates/resvg
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cp ${tmp}/release/resvg ${out}/bin/
{% endblock %}

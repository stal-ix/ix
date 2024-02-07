{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v0.39.0.tar.gz
{% endblock %}

{% block cargo_sha %}
45826f648fb0104a9409cff5bb5b4213d9c9a53f3d2b0ada28e41af0ee1df9fd
{% endblock %}

{% block cargo_refine %}
find . -type l -delete
{% endblock %}

{% block unpack %}
{{super()}}
cd crates/resvg
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cp ${tmp}/release/resvg ${out}/bin/
{% endblock %}

{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v0.43.0.tar.gz
{% endblock %}

{% block cargo_sha %}
bc1cdd560c4ba112d766e664940a7b75eed380472a662214da9c46966983efca
{% endblock %}

{% block unpack %}
{{super()}}
cd crates/resvg
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cp ${tmp}/release/resvg ${out}/bin/
{% endblock %}

{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v0.40.0.tar.gz
{% endblock %}

{% block cargo_sha %}
c36f11f8141ca9b683513216bde90a067408370a8700e591efb5c3a23bf0927a
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

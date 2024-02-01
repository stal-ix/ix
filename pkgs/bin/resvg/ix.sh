{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v0.38.0.tar.gz
{% endblock %}

{% block cargo_sha %}
34df5b2c28692f6a1a3682ece117c8ff5e1a2472f40ba0d061c5a8b590ba0f11
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

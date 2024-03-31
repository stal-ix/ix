{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/RazrFalcon/resvg/archive/refs/tags/v0.40.0.tar.gz
{% endblock %}

{% block cargo_sha %}
73ab788d1dfb5fb5d22ec2b0de812fc78a798764590adb77cd8f50fd709244b1
{% endblock %}

{% block unpack %}
{{super()}}
cd crates/resvg
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cp ${tmp}/release/resvg ${out}/bin/
{% endblock %}

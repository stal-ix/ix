{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/ekzhang/bore/archive/refs/tags/v0.5.0.tar.gz
{% endblock %}

{% block cargo_sha %}
33476760ff936cd8df1fb7feace65106a96d37f5cd8fba255b863b3614bde897
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/bore ${out}/bin/
{% endblock %}

{% block cargo_features %}
{% endblock %}

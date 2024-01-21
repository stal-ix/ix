{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.17.2.tar.gz
{% endblock %}

{% block cargo_sha %}
1c2f8ca26aba8467addf7bced88c53d92b58bc841a21f6fc5b8d9b46e74f246f
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}

{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.10.tar.gz
{% endblock %}

{% block cargo_sha %}
e0b029fe44f427033480c59ed7e4898715d1bceac20d08ae4fb8558b95ea6656
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}

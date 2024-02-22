{% extends '//die/rust/cargo_v2.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.18.4.tar.gz
{% endblock %}

{% block cargo_sha %}
b7491b40b5634e608b34edc84abc61beccd1704e65b51e3f00868c1aa73d53e6
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}

{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.3.tar.gz
{% endblock %}

{% block cargo_sha %}
c1ed8a95169ee59368795539b0fc3c181c46f00e0380feab3ad003a0af60f756
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/eza ${out}/bin/
{% endblock %}

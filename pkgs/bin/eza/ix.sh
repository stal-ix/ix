{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/eza-community/eza/archive/refs/tags/v0.20.18.tar.gz
{% endblock %}

{% block cargo_sha %}
aefd6954a147a586801627f17b6524d75f3e39777f3fb49d04d1acb383486f45
{% endblock %}

{% block bld_libs %}
lib/git/2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/eza ${out}/bin/
{% endblock %}

{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/NOBLES5E/cproxy/archive/refs/tags/v4.1.6.post1.tar.gz
{% endblock %}

{% block cargo_sha %}
37e95b716448e30944030fb4e5d7c679ae039dd97394d9fe43a0d49166ad8a7a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/cproxy ${out}/bin/
{% endblock %}

{% block cargo_ver %}
v3
{% endblock %}

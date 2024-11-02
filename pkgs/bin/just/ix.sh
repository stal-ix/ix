{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/casey/just/archive/refs/tags/1.36.0.tar.gz
{% endblock %}

{% block cargo_sha %}
dddede76c0aa2845e02837f0fb7dd57388bbcfed28473d6b988317f23692a537
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/just ${out}/bin/
{% endblock %}

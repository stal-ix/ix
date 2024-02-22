{% extends '//die/rust/cargo.sh' %}

{% block cargo_url %}
https://github.com/NOBLES5E/cproxy/archive/refs/tags/v4.1.6.post1.tar.gz
{% endblock %}

{% block cargo_sha %}
08927476e8e1930f9cd2383b7770dc47bbb709a28e327ab7da9a8706eab9cfbb
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/release/cproxy ${out}/bin/
{% endblock %}

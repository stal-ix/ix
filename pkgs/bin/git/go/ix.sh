{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/go-git/go-git/archive/refs/tags/v5.4.2.tar.gz
{% endblock %}

{% block go_sha %}
88947a372e5ebe0a107dc331c4dde9610ec94396b57ee986bb6f018602ca41c0
{% endblock %}

{% block unpack %}
{{super()}}
cd cli/go-git
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp go-git ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}

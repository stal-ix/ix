{% extends '//die/go/build.sh' %}

{% block pkg_name %}
go-git
{% endblock %}

{% block version %}
5.4.2
{% endblock %}

{% block go_url %}
https://github.com/go-git/go-git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
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

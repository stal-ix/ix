{% extends '//die/go/build.sh' %}

{% block pkg_name %}
go-git
{% endblock %}

{% block version %}
5.10.0
{% endblock %}

{% block go_url %}
https://github.com/go-git/go-git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1678a321a00f69a48629ea79ae2f8db420a44c8750346fc48ad832c745465ad5
{% endblock %}

{% block unpack %}
{{super()}}
cd cli/go-git
{% endblock %}

{% block go_bins %}
go-git
{% endblock %}

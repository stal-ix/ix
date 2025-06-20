{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cast-text
{% endblock %}

{% block version %}
0.1.1
{% endblock %}

{% block go_url %}
https://github.com/piqoni/cast-text/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
c9d0b04760d7a5fa1e6b222a7bb7a461f75c6c5886a50190f95552412a03ef5a
{% endblock %}

{% block go_bins %}
cast-text
{% endblock %}

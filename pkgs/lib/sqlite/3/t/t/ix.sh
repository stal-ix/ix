{% extends '//die/c/configure.sh' %}

{% block pkg_name %}
sqlite
{% endblock %}

{% block version %}
3.54.1
{% endblock %}

{% block sqlite_ver %}
{{self.version() | strip | field(0)}}{{self.version() | strip | field(1) | pad(3)}}{{self.version() | strip | field(2) | pad(3)}}
{% endblock %}

{% block fetch %}
https://www.sqlite.org/2026/sqlite-autoconf-{{self.sqlite_ver().strip()}}.tar.gz
926ef8d3eab93fbf6e06011901273eec076b25594a4e1cdadd50c987f4f6d64e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

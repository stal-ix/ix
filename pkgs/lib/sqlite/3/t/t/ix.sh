{% extends '//die/c/configure.sh' %}

{% block pkg_name %}
sqlite
{% endblock %}

{% block version %}
3.50.4
{% endblock %}

{% block sqlite_ver %}
{{self.version() | strip | field(0)}}{{self.version() | strip | field(1) | pad(3)}}{{self.version() | strip | field(2) | pad(3)}}
{% endblock %}

{% block fetch %}
https://www.sqlite.org/2025/sqlite-autoconf-{{self.sqlite_ver().strip()}}.tar.gz
a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% extends '//die/c/configure.sh' %}

{% block pkg_name %}
sqlite
{% endblock %}

{% block version %}
3.50.0
{% endblock %}

{% block sqlite_ver %}
{{self.version() | strip | field(0)}}{{self.version() | strip | field(1) | pad(3)}}{{self.version() | strip | field(2) | pad(3)}}
{% endblock %}

{% block fetch %}
https://www.sqlite.org/2025/sqlite-autoconf-{{self.sqlite_ver().strip()}}.tar.gz
sha:3bc776a5f243897415f3b80fb74db3236501d45194c75c7f69012e4ec0128327
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% extends '//die/c/configure.sh' %}

{% block pkg_name %}
sqlite
{% endblock %}

{% block version %}
3.50.2
{% endblock %}

{% block sqlite_ver %}
{{self.version() | strip | field(0)}}{{self.version() | strip | field(1) | pad(3)}}{{self.version() | strip | field(2) | pad(3)}}
{% endblock %}

{% block fetch %}
https://www.sqlite.org/2025/sqlite-autoconf-{{self.sqlite_ver().strip()}}.tar.gz
84a616ffd31738e4590b65babb3a9e1ef9370f3638e36db220ee0e73f8ad2156
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

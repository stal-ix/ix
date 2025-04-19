{% extends '//die/c/configure.sh' %}

{% block pkg_name %}
sqlite
{% endblock %}

{% block version %}
3.49.1
{% endblock %}

{% block sqlite_ver %}
{{self.version() | strip | field(0)}}{{self.version() | strip | field(1) | pad(3)}}{{self.version() | strip | field(2) | pad(3)}}
{% endblock %}

{% block fetch %}
https://www.sqlite.org/2025/sqlite-autoconf-{{self.sqlite_ver().strip()}}.tar.gz
sha:106642d8ccb36c5f7323b64e4152e9b719f7c0215acf5bfeac3d5e7f97b59254
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cpp_defines %}
SQLITE_OMIT_LOAD_EXTENSION=1
SQLITE_ENABLE_COLUMN_METADATA=1
{% endblock %}

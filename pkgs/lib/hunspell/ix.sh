{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
hunspell
{% endblock %}

{% block version %}
1.7.1
{% endblock %}

{% block fetch %}
https://github.com/hunspell/hunspell/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:6e3557624c608b3e6525b8bd277706db4f5a857c28fdb3cfa8d0d2b67776da8a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

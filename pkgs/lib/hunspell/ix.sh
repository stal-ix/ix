{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/hunspell/hunspell/archive/refs/tags/v1.7.1.tar.gz
sha:6e3557624c608b3e6525b8bd277706db4f5a857c28fdb3cfa8d0d2b67776da8a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

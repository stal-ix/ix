{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libexif
{% endblock %}

{% block version %}
0.6.25
{% endblock %}

{% block fetch %}
https://github.com/libexif/libexif/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:b23af41f37019b8d591d4d9b42ba52fd30709b6767341aa887f9afe400c8408a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

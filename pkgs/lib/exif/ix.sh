{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libexif
{% endblock %}

{% block version %}
0.6.26
{% endblock %}

{% block fetch %}
https://github.com/libexif/libexif/archive/refs/tags/v{{self.version().strip()}}.tar.gz
32e591455339504b7d02f3e9b0a48f16f5455462a9059a7f47639980e82e4bc1
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

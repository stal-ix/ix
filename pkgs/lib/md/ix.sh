{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libmd
{% endblock %}

{% block version %}
1.2.0
{% endblock %}

{% block fetch %}
https://libbsd.freedesktop.org/releases/libmd-{{self.version().strip()}}.tar.xz
ac15ffb8430502fbaccdec66c5a82ee0eab0b0f36220df56710feadfeb13d0a0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

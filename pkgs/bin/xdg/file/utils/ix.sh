{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
desktop-file-utils
{% endblock %}

{% block version %}
0.29
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/xdg/desktop-file-utils/-/archive/{{self.version().strip()}}/desktop-file-utils-{{self.version().strip()}}.tar.bz2
ad9c083613563a757020f8ec1cb60dc2706fd16fcbed06b4ddfa877665ec83a6
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
{% endblock %}

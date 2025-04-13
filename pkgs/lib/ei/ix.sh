{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libei
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libei/-/archive/{{self.version().strip()}}/libei-{{self.version().strip()}}.tar.bz2
sha:4346b471d9635e64aff8ac3be7e07aaf2c0456d8332ab5934d53aae0e0f34162
{% endblock %}

{% block lib_deps %}
lib/c
lib/basu
lib/evdev
lib/xkb/common
{% endblock %}

{% block bld_libs %}
pip/attrs
pip/jinja2
lib/kernel
{% endblock %}

{% block c_rename_symbol %}
strv_from_string
strv_join
{% endblock %}

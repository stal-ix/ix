{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libei/-/archive/1.3.901/libei-1.3.901.tar.bz2
sha:ecf41a071a38d712da633b579d8afbbf2ca134cbe0ab2162172f79941ae39e81
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

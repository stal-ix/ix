{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libei/-/archive/1.3.0/libei-1.3.0.tar.bz2
sha:167692196e735e6141dd7027e294fd9f99a4ce7cf0c797b5051764ffe147ec80
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

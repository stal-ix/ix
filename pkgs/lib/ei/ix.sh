{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libei/-/archive/1.2.0/libei-1.2.0.tar.bz2
sha:c9566812722b703435230b38379f33fd4429b999cd56d10c26f4e01ed76afcaf
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


{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libei/-/archive/1.1.0/libei-1.1.0.tar.bz2
sha:b9868dc64ba0549c7034ba0828bd9973f21e542036d25a662de4dfbc26a6b867
{% endblock %}

{% block lib_deps %}
lib/c
lib/basu
lib/evdev
lib/xkbcommon
{% endblock %}

{% block bld_libs %}
pip/attrs
pip/jinja2
lib/kernel
{% endblock %}


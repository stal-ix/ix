{% extends '//mix/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/libinput/libinput-1.19.3.tar.xz
a9f6fe8156739b51593674183cb25399
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev
lib/mtdev
lib/wacom
lib/evdev
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

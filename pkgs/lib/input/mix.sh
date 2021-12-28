{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/libinput/libinput-1.19.2.tar.xz
2c7f2aa4032bacb562a535b74829c56d
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
-Ddebug-gui=false
-Dtests=false
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.14.1/wlroots-0.14.1.tar.bz2
7c8a3246e7ddb724bf7397a2f8f9b782
{% endblock %}

{% block lib_deps %}
lib/drm/mix.sh
lib/udev/mix.sh
lib/seat/mix.sh
lib/input/mix.sh
lib/opengl/mix.sh
lib/pixman/mix.sh
lib/wayland/mix.sh
lib/xkbcommon/mix.sh
{% endblock %}

{% block bld_tool %}
lib/wayland/protocols/mix.sh
{% endblock %}

{% block meson_flags %}
-Dxwayland=disabled
-Drenderers=gles2
#-Dbackends=drm,libinput
{% endblock %}

{% block setup %}
export CPPFLAGS="-DNSEC_PER_SEC=WLR_NSEC_PER_SEC ${CPPFLAGS}"
{% endblock %}

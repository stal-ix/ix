{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.14.1/wlroots-0.14.1.tar.bz2
7c8a3246e7ddb724bf7397a2f8f9b782
{% endblock %}

{% block lib_deps %}
lib/wayland/mix.sh
lib/wayland/protocols/mix.sh
lib/mesa/mix.sh
lib/drm/mix.sh
lib/input/mix.sh
lib/xkbcommon/mix.sh
lib/udev/mix.sh
lib/pixman/mix.sh
lib/seat/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
{% endblock %}

{% block meson_flags %}
-Dxwayland=disabled
-Drenderers=gles2
#-Dbackends=drm,libinput
{% endblock %}

{% block setup %}
export CPPFLAGS="-w -DNSEC_PER_SEC=WLR_NSEC_PER_SEC ${CPPFLAGS}"
{% endblock %}

{% block postinstall %}
exit 1
{% endblock %}

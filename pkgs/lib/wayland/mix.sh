{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://wayland.freedesktop.org/releases/wayland-1.19.0.tar.xz
5d59ac3d8a8f4e42de2ceb8bb19dfca9
{% endblock %}

{% block bld_tool %}
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
{% endblock %}

{% block lib_deps %}
lib/ffi/mix.sh
{% endblock %}

{% block bld_libs %}
lib/expat/mix.sh
lib/xml2/mix.sh
{% endblock %}

{% block meson_flags %}
-Ddocumentation=false
{% endblock %}

{% block patch %}
cat tests/test-runner.h | grep -v '#error' > _ && mv _ tests/test-runner.h
sed -e 's|epoll_create1|xxx_epoll_create1|' -i tests/os-wrappers-test.c
{% endblock %}

{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/libevdev/libevdev-1.11.0.tar.xz
b09838ec120dabeebc08fa6a1943594f
{% endblock %}

{% block bld_tool %}
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
{% endblock %}

{% block meson_flags %}
-Dtests=disabled
-Ddocumentation=disabled
{% endblock %}

{% block bld_libs %}
lib/linux/mix.sh
{% endblock %}

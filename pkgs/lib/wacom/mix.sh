{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/archive/refs/tags/libwacom-1.12.tar.gz
1d2cff159404674d791f9b28be364c51
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev/g
{% endblock %}

{% block meson_flags %}
-Dtests=disabled
{% endblock %}

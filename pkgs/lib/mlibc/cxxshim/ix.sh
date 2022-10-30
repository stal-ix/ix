{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/managarm/cxxshim/archive/82344efd46c0356272800c3b5bd3286fc681e114.zip
sha:d74dc6e0d2524fed962887514ada1a0ff0371bf7f2d0b5e41af3354f54c8131c
{% endblock %}

{% block meson_flags %}
install_headers=true
{% endblock %}

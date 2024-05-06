{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Aetf/kmscon/archive/refs/tags/v9.0.0.tar.gz
sha:eb594e48768962b665959aa9a643934f986bee68163b4ab593b9e6c987be825c
{% endblock %}

{% block bld_libs %}
lib/c
lib/tsm
lib/drm
lib/udev
lib/xkb/common
{% endblock %}

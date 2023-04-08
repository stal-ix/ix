{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/emersion/libdisplay-info/-/archive/0.1.1/libdisplay-info-0.1.1.tar.bz2
sha:51cdb0362882ca2af62532ab4d95e60d81e9890b339264719fd55f8e3945d695
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_data %}
aux/hwdata
{% endblock %}

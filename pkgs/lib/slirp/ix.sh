{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v4.7.0/libslirp-v4.7.0.tar.bz2
sha:358ce8b6ea59ec9deac937cc754f0115b992839e7b0cddf30ffb8f77dc21da82
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

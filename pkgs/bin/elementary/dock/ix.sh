{% extends '//die/vala/meson.sh' %}

{# hard X11 dep #}

{% block fetch %}
https://github.com/elementary/dock/archive/refs/tags/8.0.0.tar.gz
sha:9aac9b6e5774adf5bd95605173b2d120036ee5605f28f8e12bc6d4a9bc9e78b8
{% endblock %}

{% block bld_libs %}
lib/c
lib/gee
lib/gtk/4
lib/granite
lib/adwaita
lib/shim/fake/pkg(pkg_name=gtk4-x11,pkg_ver=100500)
{% endblock %}

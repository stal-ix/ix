{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://codeberg.org/dnkl/tllist/archive/1.1.0.zip
sha:9eb339e668d50e44ac1ffef825e8d17948e199d05840fd0e77775324ce3ffb4d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

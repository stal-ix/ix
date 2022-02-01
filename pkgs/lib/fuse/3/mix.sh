{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-3.10.5.tar.gz
sha:e73f75e58da59a0e333d337c105093c496c0fd7356ef3a5a540f560697c9c4e6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block meson_flags %}
utils=false
useroot=false
{% endblock %}

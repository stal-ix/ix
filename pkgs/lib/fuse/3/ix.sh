{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-3.12.0.tar.gz
sha:df6cc8807c4fd36b6b0ebef2b738dad6d19a9c7c085ccc3775063688d0bfcc0b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block meson_flags %}
utils=false
useroot=false
{% endblock %}

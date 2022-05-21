{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/libfuse/libfuse/archive/refs/tags/fuse-3.11.0.tar.gz
sha:25a00226d2d449c15b2f08467d6d5ebbb2a428260c4ab773721c32adbc6da072
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

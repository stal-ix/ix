{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/c-util/c-rbtree/archive/refs/tags/v3.2.0.tar.gz
sha:5440bdce011e37c63e5b8b56c1ecbefc26b08d3e83c9fa2cb94762e7a6fc8749
{% endblock %}

{% block lib_deps %}
lib/c/util/stdaux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}


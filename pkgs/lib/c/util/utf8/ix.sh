{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/c-util/c-utf8/archive/refs/tags/v1.1.0.tar.gz
sha:8f948eaaa4ac69393adf96632fd06174ca1531bb4bb0728355281411b87bdf7d
{% endblock %}

{% block lib_deps %}
lib/c/util/stdaux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}


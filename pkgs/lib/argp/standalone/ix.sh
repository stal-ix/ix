{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/argp-standalone/argp-standalone/archive/refs/tags/1.5.0.tar.gz
sha:c29eae929dfebd575c38174f2c8c315766092cec99a8f987569d0cad3c6d64f6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

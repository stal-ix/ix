{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
argp-standalone
{% endblock %}

{% block version %}
1.5.0
{% endblock %}

{% block fetch %}
https://github.com/argp-standalone/argp-standalone/archive/refs/tags/{{self.version().strip()}}.tar.gz
c29eae929dfebd575c38174f2c8c315766092cec99a8f987569d0cad3c6d64f6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

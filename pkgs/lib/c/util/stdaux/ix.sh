{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
c-stdaux
{% endblock %}

{% block version %}
1.6.0
{% endblock %}

{% block fetch %}
https://github.com/c-util/c-stdaux/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2ee2b7604a18b919f97f4357e61219520ec0b6e73f4d64ed9902cf1b5af047df
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libunibreak
{% endblock %}

{% block version %}
8.0.1
{% endblock %}

{% block fetch %}
https://github.com/adah1972/libunibreak/archive/refs/tags/libunibreak_{{self.version().strip().replace('.', '_')}}.tar.gz
96e9074daf1f45ae9ddf461b5a9801991a6fe8b2025ea786486e0e023c34a2c5
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

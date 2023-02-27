{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/adah1972/libunibreak/archive/refs/tags/libunibreak_5_1.tar.gz
sha:d59878d82c84a60b592940a8e1a264f0a9714f0a9a8868b099846f780d9dc167
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

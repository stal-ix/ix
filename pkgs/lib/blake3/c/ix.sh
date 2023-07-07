{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/1.4.1.tar.gz
sha:33020ac83a8169b2e847cc6fb1dd38806ffab6efe79fe6c320e322154a3bea2c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}

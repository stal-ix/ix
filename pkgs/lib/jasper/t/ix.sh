{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/jasper-software/jasper/archive/refs/tags/version-4.2.4.tar.gz
sha:23a3d58cdeacf3abdf9fa1d81dcefee58da6ab330940790c0f27019703bfd2cd
{% endblock %}

{% block lib_deps %}
lib/c
lib/heif
lib/jpeg
{% endblock %}

{% block cmake_flags %}
JAS_CROSSCOMPILING=ON
JAS_STDC_VERSION=201112L
{% endblock %}

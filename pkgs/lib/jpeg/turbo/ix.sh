{% extends '//die/c/cmake.sh' %}

{% block fetch %}
#https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/2.1.5.1.tar.gz
#sha:61846251941e5791005fb7face196eec24541fce04f12570c308557529e92c75
https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/3.0.0.tar.gz
sha:171dae5d73560bc94006a7c0c3281bd9bfde6a34f7e41e66f930a1a9162bd7df
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
{% if x86_64 %}
REQUIRE_SIMD=ON
{% endif %}
ENABLE_SHARED=OFF
{% endblock %}

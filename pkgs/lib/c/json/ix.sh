{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/DaveGamble/cJSON/archive/refs/tags/v1.7.17.tar.gz
sha:c91d1eeb7175c50d49f6ba2a25e69b46bd05cffb798382c19bfb202e467ec51c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
CJSON_BUILD_SHARED_LIBS=OFF
ENABLE_CJSON_TEST=OFF
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

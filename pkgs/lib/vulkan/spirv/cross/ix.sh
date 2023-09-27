{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/SPIRV-Cross/archive/refs/tags/sdk-1.3.261.1.tar.gz
sha:a5cf99ed62e93800232e50b782890321d4d7e053dcaa71bd8efc0c48a00bd1dd
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/Rezonality/zep
{% endblock %}

{% block git_commit %}
cd61d52c4dfc242032062e5f7d0822dd4b75b3cf
{% endblock %}

{% block git_sha %}
0ecb68151824ca114c932a2135d9c7c246bb5ea473a86c59241375a7620b3444
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
BUILD_IMGUI=ON
BUILD_TESTS=OFF
{% endblock %}

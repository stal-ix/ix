{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/Rezonality/zep
{% endblock %}

{% block git_commit %}
cd61d52c4dfc242032062e5f7d0822dd4b75b3cf
{% endblock %}

{% block git_sha %}
83858d9f52e68333a9a642da3a3dd27be40cb4227386be8b7b017eba065570bd
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
BUILD_IMGUI=ON
BUILD_TESTS=OFF
{% endblock %}

{% block git_version %}
v3
{% endblock %}

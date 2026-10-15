{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/magiblot/turbo
{% endblock %}

{% block git_commit %}
45a02f7de283b404e3be40712adf0f125bda4641
{% endblock %}

{% block git_sha %}
2b91faa0420222f83dbe51d707e69e9d419846e728320b517cad7fd98d1d9fe1
{% endblock %}

{% block git_version %}
v4
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/magic
lib/tvision
lib/clipboard
{% endblock %}

{% block cmake_flags %}
TURBO_OPTIMIZE_BUILD=OFF
TURBO_USE_SYSTEM_DEPS=ON
TURBO_USE_SYSTEM_TVISION=ON
{% endblock %}

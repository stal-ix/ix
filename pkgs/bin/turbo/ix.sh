{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/magiblot/turbo
{% endblock %}

{% block git_commit %}
45a02f7de283b404e3be40712adf0f125bda4641
{% endblock %}

{% block git_sha %}
3781ad60fbc57e37c9a2fc8fd2fbcb1f78ffb459396f03ed16884022cb5fe386
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

{% block git_version %}
v3
{% endblock %}

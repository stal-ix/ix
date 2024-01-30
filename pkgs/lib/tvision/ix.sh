{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/magiblot/tvision
{% endblock %}

{% block git_commit %}
92177cb365b523b0bc3e17d865292045ed7e0073
{% endblock %}

{% block git_sha %}
5413496da748c31a9e342fb8e386de4971673597cf127f8c85ecc7aacd100201
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/kernel
lib/curses
{% endblock %}

{% block cmake_flags %}
TV_OPTIMIZE_BUILD=OFF
{% endblock %}

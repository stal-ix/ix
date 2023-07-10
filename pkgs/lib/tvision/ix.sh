{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/magiblot/tvision
{% endblock %}

{% block git_commit %}
92177cb365b523b0bc3e17d865292045ed7e0073
{% endblock %}

{% block git_sha %}
0614f6073fb385c7e1a12664c10c2da3ddc9d86f85788eb227696d9b47dd07bd
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/kernel
lib/curses
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/magiblot/tvision
{% endblock %}

{% block git_commit %}
92177cb365b523b0bc3e17d865292045ed7e0073
{% endblock %}

{% block git_sha %}
8bd02d9e89b661fcfbe1813923b6d452fc123e96b97d87a79204b934b928669d
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

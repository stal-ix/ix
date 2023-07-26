{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/TelegramMessenger/rlottie
{% endblock %}

{% block git_commit %}
67f103bc8b625f2a4a9e94f1d8c7bd84c5a08d1d
{% endblock %}

{% block git_sha %}
e56a0e69d14b6545bbc4b363c1125c5b6c027321c9f59d721c24271aada72436
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cmake_flags %}
LOTTIE_MODULE=OFF
LIB_INSTALL_DIR=${out}/lib
{% endblock %}

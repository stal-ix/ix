{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/TelegramMessenger/rlottie
{% endblock %}

{% block git_commit %}
67f103bc8b625f2a4a9e94f1d8c7bd84c5a08d1d
{% endblock %}

{% block git_sha %}
f6bc7ad3b9ff7f7a1b820999de8dcf2d5f8104dc3bb66346adb99cb1ff3e591b
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

{% block git_version %}
v3
{% endblock %}

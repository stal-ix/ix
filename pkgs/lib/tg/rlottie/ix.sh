{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/TelegramMessenger/rlottie
{% endblock %}

{% block git_commit %}
67f103bc8b625f2a4a9e94f1d8c7bd84c5a08d1d
{% endblock %}

{% block git_sha %}
b866ccd7fc444b926571ef80a594cbba609b09e8a599adb26a45241d8eb33ac8
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

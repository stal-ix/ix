{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/TelegramMessenger/rlottie/archive/67f103bc8b625f2a4a9e94f1d8c7bd84c5a08d1d.zip
sha:7211ee04fc8bc36f07430423a0a9397d8793ff9c0a8feb9d802c50fb252fa9e1
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

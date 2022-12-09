{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/freedesktop/uchardet/archive/refs/tags/v0.0.8.tar.gz
sha:21d9aaf1ab383575e4d0cea0bad379788df22e2ca99cf603b9393faef71cd2ed
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

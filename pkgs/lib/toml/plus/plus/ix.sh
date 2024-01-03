{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/marzer/tomlplusplus/archive/refs/tags/v3.4.0.tar.gz
sha:8517f65938a4faae9ccf8ebb36631a38c1cadfb5efa85d9a72e15b9e97d25155
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

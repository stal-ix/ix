{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ToruNiina/toml11/archive/refs/tags/v4.1.0.tar.gz
sha:fb4c02cc708ae28e6fc3496514e3625e4b6738ed4ce40897710ca4d7a29de4f7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}


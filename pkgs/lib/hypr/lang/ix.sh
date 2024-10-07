{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprlang/archive/refs/tags/v0.5.3.tar.gz
sha:9715311d6b31c18f1e83da999269c71a61c0862645795d2666fa1d7b20d5d0f6
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/hypr/utils
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprlang/archive/refs/tags/v0.5.0.tar.gz
sha:c59e705f2c2ff9ea4e2b183fdf0bc20a62b7162604a657d6352716a1fd5061b2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

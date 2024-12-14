{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprlang/archive/refs/tags/v0.6.0.tar.gz
sha:b1a163606402041d92507936fb6dcbc40dd0035b8e8abbf44b0ab59be627b52c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/hypr/utils
{% endblock %}

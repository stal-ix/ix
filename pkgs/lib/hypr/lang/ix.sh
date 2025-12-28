{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprlang
{% endblock %}

{% block version %}
0.6.7
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprlang/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e8d54af895ec04fe99553c68d1255dceddb43723ada4a134acdd46bfe1dbf924
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/hypr/utils
{% endblock %}

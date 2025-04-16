{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
hyprlang
{% endblock %}

{% block version %}
0.6.1
{% endblock %}

{% block fetch %}
https://github.com/hyprwm/hyprlang/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:8537bb112c633b3463850747d1fd29e1e1884df2cc4659c12736b941ba06e6bb
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/hypr/utils
{% endblock %}

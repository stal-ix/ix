{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprlang/archive/refs/tags/v0.4.1.tar.gz
dd00b48fc31199c3f30f4ef6ec61f3bddcc092eff2628ee28cb238a4501521e8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

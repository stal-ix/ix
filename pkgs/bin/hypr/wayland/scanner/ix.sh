{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprwayland-scanner/archive/refs/tags/v0.3.4.tar.gz
sha:5657a57634cae68c7a82ed31de28e653058852eee4baea9beb2f69629ba4c7f1
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/pugixml
{% endblock %}

{% block postinstall %}
:
{% endblock %}


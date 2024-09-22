{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprutils/archive/refs/tags/v0.2.2.tar.gz
sha:ff0090bdbdfa17d47ad040e1479425f628e4aa094bd1b47fc332adbd9ed4fff3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/pixman
{% endblock %}

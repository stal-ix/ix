{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/hyprwm/hyprutils/archive/refs/tags/v0.2.5.tar.gz
sha:19737eca82d9a4c4b4108864960d7f460ad670c1fd95a87a90640153c91dc818
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/pixman
{% endblock %}

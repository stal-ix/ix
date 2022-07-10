{% extends '//die/cmake.sh' %}

{% block fetch %}
https://codeberg.org/soundtouch/soundtouch/archive/2.3.1.tar.gz
sha:42633774f372d8cb0a33333a0ea3b30f357c548626526ac9f6ce018c94042692
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

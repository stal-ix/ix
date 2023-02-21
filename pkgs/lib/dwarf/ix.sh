{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.6.0.tar.xz
sha:8d6f2e67ac6fae59c7019bf41b58fa620187a136cd5977e117f15b820ffc7e75
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

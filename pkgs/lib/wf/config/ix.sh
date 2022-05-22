{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/WayfireWM/wf-config/archive/refs/tags/v0.7.1.tar.gz
sha:9c212f85bfb26d135610f45865b4401e0c33a0ab3577ac65042eb23ebfe91bdb
{% endblock %}

{% block lib_deps %}
lib/c
lib/glm
lib/c++
lib/xml2
lib/evdev
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

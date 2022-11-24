{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.5.0.tar.xz
sha:11fa822c60317fa00e1a01a2ac9e8388f6693e8662ab72d352c5f50c7e0112a9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

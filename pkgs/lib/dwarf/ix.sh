{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.9.0.tar.xz
sha:d3cad80a337276a7581bb90ebcddbd743484a99a959157c066dd30f7535db59b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

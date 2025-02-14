{% extends '//die/c/meson.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/pluto/vg
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/lunasvg \${CPPFLAGS}"
{% endblock %}

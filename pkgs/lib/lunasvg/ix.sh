{% extends '//die/c/meson.sh' %}

{% include 'ver.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/pluto/vg
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/lunasvg \${CPPFLAGS}"
{% endblock %}

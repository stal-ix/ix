{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.cairographics.org/releases/pixman-0.42.0.tar.gz
sha:07f74c8d95e4a43eb2b08578b37f40b7937e6c5b48597b3a0bb2c13a53f46c13
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/pixman-1 \${CPPFLAGS}"
{% endblock %}

{% extends '//die/meson.sh' %}

{% block fetch %}
https://www.cairographics.org/releases/pixman-0.40.0.tar.gz
sha:6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b9021f5534db223fc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/pixman-1 \${CPPFLAGS}"
{% endblock %}

{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.9.2.tar.xz
sha:22b66d06831a76f6a062126cdcad3fcc58540b89a1acb23c99f8861f50999ec3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

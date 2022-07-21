{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://libbsd.freedesktop.org/releases/libmd-1.0.4.tar.xz
sha:f51c921042e34beddeded4b75557656559cf5b1f2448033b4c1eec11c07e530f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

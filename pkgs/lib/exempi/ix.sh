{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://libopenraw.freedesktop.org/download/exempi-2.6.5.tar.xz
sha:ff538114e82c51e5287064dfbec7d9790ac91479bf2390bcc6408fad4d77fb12
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/glib
lib/expat
lib/boost
{% endblock %}

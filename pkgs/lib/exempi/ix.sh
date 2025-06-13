{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
exempi
{% endblock %}

{% block version %}
2.6.5
{% endblock %}

{% block fetch %}
https://libopenraw.freedesktop.org/download/exempi-{{self.version().strip()}}.tar.xz
ff538114e82c51e5287064dfbec7d9790ac91479bf2390bcc6408fad4d77fb12
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/glib
lib/expat
lib/boost
{% endblock %}

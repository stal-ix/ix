{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ddcutil
{% endblock %}

{% block version %}
2.1.4
{% endblock %}

{% block fetch %}
https://github.com/rockowitz/ddcutil/archive/refs/tags/v{{self.version().strip()}}.tar.gz
cd8325d399399edba3df4ec58a4051c7c54fcf4fbc8f62937c6f19adb303f4ba
{% endblock %}

{% block bld_libs %}
lib/c
lib/usb
lib/drm
lib/glib
lib/kernel
lib/jansson
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

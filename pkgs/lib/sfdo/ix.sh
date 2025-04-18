{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsfdo
{% endblock %}

{% block version %}
0.1.4
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/vyivel/libsfdo/-/archive/v{{self.version().strip()}}/libsfdo-v{{self.version().strip()}}.tar.bz2
sha:155702f21c282693ead7818198fde194ab7c76e0cf1a21bc7b404e5f9ec2c369
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libpciaccess
{% endblock %}

{% block version %}
0.18.1
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/archive/libpciaccess-{{self.version().strip()}}/libpciaccess-libpciaccess-{{self.version().strip()}}.tar.bz2
6faca7b27ed76547bdd44a152a04b37d9ddc8de7f17e58780e7f80fb2c0971cd
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

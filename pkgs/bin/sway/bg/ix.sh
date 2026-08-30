{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
swaybg
{% endblock %}

{% block version %}
1.2.2
{% endblock %}

{% block fetch %}
https://github.com/swaywm/swaybg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
94e5c06a765d969e554b0f321f9cdf9c283a3fdaf70ad4e3d28163b21bd4d240
{% endblock %}

{% block bld_libs %}
lib/c
lib/cairo
lib/wayland
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}

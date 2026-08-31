{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
xdg-dbus-proxy
{% endblock %}

{% block version %}
0.1.8
{% endblock %}

{% block fetch %}
https://github.com/flatpak/xdg-dbus-proxy/archive/refs/tags/{{self.version().strip()}}.tar.gz
722e2a327acd2cd053b864e65f2f507ba02f966d3622a50040f4e3486f50c9c4
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
{% endblock %}

{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
xdg-dbus-proxy
{% endblock %}

{% block version %}
0.1.9
{% endblock %}

{% block fetch %}
https://github.com/flatpak/xdg-dbus-proxy/archive/refs/tags/{{self.version().strip()}}.tar.gz
88e793b5f89a4ff55c7212d8f9cda38fcf8434614bd05669d4c6562622d63bdd
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
{% endblock %}

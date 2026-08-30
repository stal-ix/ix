{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
transmission-remote-gtk
{% endblock %}

{% block version %}
1.7.1
{% endblock %}

{% block fetch %}
https://github.com/transmission-remote-gtk/transmission-remote-gtk/archive/refs/tags/{{self.version().strip()}}.tar.gz
3a1ff61bd7bf6a0b112f5cd9b7d3a788dfb9d1efcdd3349ce3f47b4aa27b3389
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/curl
lib/gtk/3
lib/soup/3
lib/json/glib
lib/app/indicator
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/glib
{% endblock %}

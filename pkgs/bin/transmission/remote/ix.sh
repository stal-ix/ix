{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
transmission-remote-gtk
{% endblock %}

{% block version %}
1.5.1
{% endblock %}

{% block fetch %}
https://github.com/transmission-remote-gtk/transmission-remote-gtk/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:9d30211b2bd85c4b39b9ac287b315a60776f8d54592ab380aea3fa679aceb3b0
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/curl
lib/gtk/3
lib/json/glib
lib/app/indicator
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/glib
{% endblock %}

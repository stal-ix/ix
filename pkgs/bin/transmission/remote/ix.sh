{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
transmission-remote-gtk
{% endblock %}

{% block version %}
1.6.0
{% endblock %}

{% block fetch %}
https://github.com/transmission-remote-gtk/transmission-remote-gtk/archive/refs/tags/{{self.version().strip()}}.tar.gz
92ca12aa94d14d6c9ce2b8e4d12c5e44f85f748348e3b0d54126de56ee5dc841
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

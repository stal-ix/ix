{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/transmission-remote-gtk/transmission-remote-gtk/archive/refs/tags/1.5.1.tar.gz
sha:9d30211b2bd85c4b39b9ac287b315a60776f8d54592ab380aea3fa679aceb3b0
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/curl
lib/gtk/3
lib/json/glib
lib/appindicator
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/glib/codegen
{% endblock %}

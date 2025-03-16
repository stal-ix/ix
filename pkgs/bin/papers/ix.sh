{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://gitlab.gnome.org/GNOME/Incubator/papers
{% endblock %}

{% block git_branch %}
48.0
{% endblock %}

{% block git_sha %}
71fbc5600d8be3a34aa7b60a41fd89fb9bb159e15ee2e28479b662858df5f472
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/t1
lib/intl
lib/dbus
lib/glib
lib/xml/2
lib/gtk/4
lib/secret
lib/adwaita
lib/spectre
lib/archive
lib/poppler
lib/djvulibre
lib/gdk/pixbuf/svg
lib/gsettings/desktop/schemas
{% endblock %}

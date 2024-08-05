{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/gsettings-desktop-schemas/archive/refs/tags/47.beta.tar.gz
sha:f2b0d4f621426b78011c6de99e16a29e469b0e9f9ba1f1b354415095c95499b7
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
introspection=false
{% endblock %}

{% block postinstall %}
: skip it
{% endblock %}

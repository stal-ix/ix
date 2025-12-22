{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
evince
{% endblock %}

{% block version %}
48.1
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/evince/48/evince-{{self.version().strip()}}.tar.xz
7d8b9a6fa3a05d3f5b9048859027688c73a788ff6e923bc3945126884943fa10
{% endblock %}

{% block modules %}
comics
djvu
pdf
ps
tiff
{% endblock %}

{% block meson_flags %}
ps=enabled
gtk_doc=false
user_doc=false
nautilus=false
previewer=false
thumbnailer=false
introspection=false
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
wrap_cc
{% endblock %}

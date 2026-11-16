{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
evince
{% endblock %}

{% block version %}
48.5
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/evince/48/evince-{{self.version().strip()}}.tar.xz
0c7aba9485d0b6fb9f3e0ee75be916544744dc2ed9d58a2f9936a2e0434ac4a6
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

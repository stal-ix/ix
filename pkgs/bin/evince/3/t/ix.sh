{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
evince
{% endblock %}

{% block version %}
48.4
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/evince/48/evince-{{self.version().strip()}}.tar.xz
f296c5c662886635d4cd597e8ac0afcde7982be4486533c2b7f095b268be8668
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

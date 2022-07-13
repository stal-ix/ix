{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gobject-introspection/-/archive/1.72.0/gobject-introspection-1.72.0.tar.bz2
sha:9b5fd295d9b4547a8ebda7fbc0fa48456524a303fd42b9ca343329990f01326c
{% endblock %}

{% block install %}
mkdir ${out}/share
cp -r m4 ${out}/share/aclocal
{% endblock %}

{% extends '//lib/vte/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vte/-/archive/0.76.0/vte-0.76.0.tar.bz2
sha:7d235b3699107a308515e2a333d5b3ca55a7568de756b04c28f333e6b5cb735b
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/lz4
lib/gtk/3
{% endblock %}

{% block meson_flags %}
{{super()}}
gtk3=true
gtk4=false
{% endblock %}

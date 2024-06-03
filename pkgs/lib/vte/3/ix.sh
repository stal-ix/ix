{% extends '//lib/vte/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vte/-/archive/0.76.3/vte-0.76.3.tar.bz2
sha:fc345b1d493095babf12bf6d812b60447ebd2747a06ef0947c6d7e20c4c8c317
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

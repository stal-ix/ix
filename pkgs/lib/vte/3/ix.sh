{% extends '//lib/vte/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vte/-/archive/0.74.2/vte-0.74.2.tar.bz2
sha:2a1162738c9bccfac1bb801125c1889d3980d857499909439803cf1def4c25d1
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/gtk/3
{% endblock %}

{% block meson_flags %}
{{super()}}
gtk3=true
gtk4=false
{% endblock %}

{% extends '//lib/vte/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vte/-/archive/0.76.2/vte-0.76.2.tar.bz2
sha:a6bd96e4ff2b8f21ce8627c554627077b9b24f4cb84bc2465cbe9625e6a657fc
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

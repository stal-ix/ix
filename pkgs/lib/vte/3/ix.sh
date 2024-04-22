{% extends '//lib/vte/t/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vte/-/archive/0.76.1/vte-0.76.1.tar.bz2
sha:ca50048f23c1ee1c1c009ffe4d32648e31232e2f4ec9d068b83bd6da7d2b06ce
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

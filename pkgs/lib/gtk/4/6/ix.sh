{% extends '//lib/gtk/4/4/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.6.6/gtk-4.6.6.tar.bz2
sha:cf18dd932c10b66a797fb2be3b263429e28b4b8ea3ffba6ce888c0c6927baca1
{% endblock %}

{% block bld_tool %}
bin/sassc
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
base64 -d << EOF > gdk/wayland/gdkdisplay-wayland.c
{% include 'gdkdisplay-wayland.c/base64' %}
EOF
{% endblock %}

{% extends '//lib/gtk/t/mix.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtk+/3.24/gtk%2B-3.24.31.tar.xz
1c4821835d6ffe7cf5b35c320f89569b
{% endblock %}

{% block lib_deps %}
lib/atk
{{super()}}
{% endblock %}

{% block bld_tool %}
lib/gdk/pixbuf
{{super()}}
{% endblock %}

{% block meson_flags %}
x11_backend=false
introspection=false
builtin_immodules=yes
{% endblock %}

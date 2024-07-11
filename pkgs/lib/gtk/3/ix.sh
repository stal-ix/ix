{% extends '//lib/gtk/t/ix.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtk+/3.24/gtk%2B-3.24.43.tar.xz
sha:7e04f0648515034b806b74ae5d774d87cffb1a2a96c468cb5be476d51bf2f3c7
{% endblock %}

{% block lib_deps %}
lib/atk
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/gdk/pixbuf
{{super()}}
{% endblock %}

{% block meson_flags %}
x11_backend=false
introspection=false
builtin_immodules=yes
{% endblock %}

{% block patch %}
{{super()}}
patch -p1 << EOF
{% include '0.diff' %}
EOF
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/gail-3.0 -I${out}/include/gtk-3.0 \${CPPFLAGS}"
{% endblock %}

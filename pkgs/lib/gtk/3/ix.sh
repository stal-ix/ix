{% extends '//lib/gtk/t/ix.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtk+/3.24/gtk%2B-3.24.35.tar.xz
sha:ec10fe6d712ef0b3c63b5f932639c9d1ae99fce94f500f6f06965629fef60bd1
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
cat << EOF > gdk/wayland/cursor/meson.build
{% include 'meson.build' %}
EOF
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/gail-3.0 -I${out}/include/gtk-3.0 \${CPPFLAGS}"
{% endblock %}

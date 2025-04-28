{% extends '//lib/gtk/t/ix.sh' %}

{% block pkg_name %}
gtk
{% endblock %}

{% block version %}
3.24.49
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/{{self.version().strip()}}/gtk-{{self.version().strip()}}.tar.bz2
sha:3645e0624badf47307d0885a8ef2fdb00dafee45e2c435cff9c205c892311a6f
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

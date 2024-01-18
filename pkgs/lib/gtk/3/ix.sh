{% extends '//lib/gtk/t/ix.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtk+/3.24/gtk%2B-3.24.40.tar.xz
sha:444dbb11f4fd5d592d74422441671854d1b744d0a7f3a3fbf9d4f936eb0552d3
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

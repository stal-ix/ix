{% extends '//lib/gtk/t/ix.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtk+/3.24/gtk%2B-3.24.31.tar.xz
sha:423c3e7fdb4c459ee889e35fd4d71fd2623562541c1041b11c07e5ad1ff10bf9
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

{% block patch %}
{{super()}}
patch -p1 << EOF
{% include '0.diff' %}
EOF
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/gail-3.0 -I${out}/include/gtk-3.0 \${CPPFLAGS}"
{% endblock %}

{% extends '//lib/gtk/t/mix.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtk+/3.24/gtk%2B-3.24.31.tar.xz
1c4821835d6ffe7cf5b35c320f89569b
{% endblock %}

{% block step_unpack1 %}
cd /home/mix/sources/CEZSFbMQFGCEjgO3/src
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
(base64 -d | patch -p1) << EOF
{% include '00.diff/base64' %}
EOF
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/gail-3.0 -I${out}/include/gtk-3.0 \${CPPFLAGS}"
{% endblock %}

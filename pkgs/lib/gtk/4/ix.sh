{% extends '//lib/gtk/t/ix.sh' %}

{% block fetch %}
#https://gitlab.gnome.org/GNOME/gtk/-/archive/4.6.7/gtk-4.6.7.tar.bz2
#sha:3dc66b6844fad3f1a19ab1898ab7103e00487e26f94758f385fe80a117062fa3
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.8.0/gtk-4.8.0.tar.bz2
sha:6d9a79bd1c3f907bef1dd1169d71066e41e6ca911b327f46ab94229f7a50788a
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/vulkan/loader
{% endblock %}

{% block bld_tool %}
bin/sassc
{{super()}}
{% endblock %}

{% block meson_flags %}
x11-backend=false
vulkan=enabled
media-ffmpeg=disabled
media-gstreamer=disabled
{% endblock %}

{% block patch %}
{{super()}}
patch -p1 << EOF
{% include '0.diff' %}
EOF
{% endblock %}

{% block env %}
export CMFLAGS="-DUSE_GTK4=ON \${CMFLAGS}"
export CPPFLAGS="-I${out}/include/gtk-4.0 \${CPPFLAGS}"
{% endblock %}

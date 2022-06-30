{% extends '//lib/gtk/t/ix.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gtk/4.4/gtk-4.4.1.tar.xz
md5:f3661ba9a9e6805172c776c9c0a3b73c
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/vulkan/loader
{% endblock %}

{% block meson_flags %}
x11-backend=false
vulkan=enabled
media-ffmpeg=disabled
media-gstreamer=disabled
{% endblock %}

{% block patch %}
(base64 -d | patch -p1) << EOF
{% include '0.diff/base64' %}
EOF

{{super()}}
{% endblock %}

{% block env_lib %}
export CMFLAGS="-DUSE_GTK4=ON \${CMFLAGS}"
export CPPFLAGS="-I${out}/include/gtk-4.0 \${CPPFLAGS}"
{% endblock %}

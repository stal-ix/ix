{% extends '//die/c/meson.sh' %}

{% block version %}
1.10.5
{% endblock %}

{% block fetch %}
https://github.com/libsixel/libsixel/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:b6654928bd423f92e6da39eb1f40f10000ae2cc6247247fc1882dcff6acbdfc8
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
lib/jpeg
#lib/gdk/pixbuf
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|sys/unistd.h|unistd.h|' -i "${l}"
done
{% endblock %}

{% block meson_flags %}
#broken
#gdk-pixbuf2=enabled
{% endblock %}

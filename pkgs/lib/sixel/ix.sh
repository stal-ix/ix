{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/libsixel/libsixel/archive/refs/tags/v1.10.3.tar.gz
sha:028552eb8f2a37c6effda88ee5e8f6d87b5d9601182ddec784a9728865f821e0
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

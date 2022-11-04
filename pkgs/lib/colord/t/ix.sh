{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/colord/releases/colord-1.4.6.tar.xz
sha:7407631a27bfe5d1b672e7ae42777001c105d860b7b7392283c8c6300de88e6f
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/usb/g
lib/udev/g
lib/lcms/2
lib/sqlite/3
{% endblock %}

{% block meson_flags %}
man=false
docs=false
vapi=false
tests=false
daemon=false
systemd=false
udev_rules=false
introspection=false
bash_completion=false
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

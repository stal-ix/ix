{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.120.tar.xz
sha:3bf55363f76c7250946441ab51d3a6cc0ae518055c0ff017324ab76cdefb327a
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
lib/pci/access
{% if not x86_64 %}
lib/atomic/ops
{% endif %}
{% endblock %}

{% block meson_flags %}
udev=true
valgrind=disabled
{% endblock %}

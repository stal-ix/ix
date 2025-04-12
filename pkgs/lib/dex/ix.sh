{% extends '//die/c/meson.sh' %}

{% block version %}
0.10.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdex/-/archive/{{self.version().strip()}}/libdex-{{self.version().strip()}}.tar.bz2
sha:afbe81ac5258844be14db1205687d3caf699dd268ce03c6171ffd83b45b92041
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/uring
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=atomic)
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block meson_flags %}
examples=false
vapi=false
introspection=disabled
tests=false
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|-latomic||g' -i ${out}/lib/pkgconfig/libdex-1.pc
{% endblock %}

{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdex/-/archive/0.9.1/libdex-0.9.1.tar.bz2
sha:e4cc4beb08acc62474c437d4f698067f0176afbc5863f362a646b9714f9b21d2
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

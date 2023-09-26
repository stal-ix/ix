{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gobject-introspection/-/archive/1.78.1/gobject-introspection-1.78.1.tar.bz2
sha:a18862a00bb7eed6a3f04e2952737ec814699acc85372ae476534990302c5e0c
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/python/3/10
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/fake/er(tool_name=g-ir-scanner)
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block meson_flags %}
gi_cross_use_prebuilt_gi=true
gi_cross_binary_wrapper=g-ir-scanner
{% endblock %}

{% block build %}
{{super()}}
>${tmp}/obj/gir/GLib-2.0.gir
>${tmp}/obj/gir/GObject-2.0.gir
>${tmp}/obj/gir/GModule-2.0.gir
>${tmp}/obj/gir/Gio-2.0.gir
>${tmp}/obj/gir/GIRepository-2.0.gir
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib/pkgconfig
{% endblock %}

{% block postinstall %}
find ${out}
{% endblock %}

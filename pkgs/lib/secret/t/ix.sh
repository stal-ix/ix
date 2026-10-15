{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libsecret
{% endblock %}

{% block version %}
0.21.8.2
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsecret/-/archive/{{self.version().strip()}}/libsecret-{{self.version().strip()}}.tar.bz2
b1487ca7d06b19730b519942c22af82549730cbd47af490a321ec4ae39f600a1
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gcrypt
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block cpp_missing %}
fcntl.h
{% endblock %}

{% block patch %}
# The installed library is static too; give the test archive a distinct name.
sed -e "s|libsecret_static = static_library('secret-|libsecret_static = static_library('secret-test-|" -i libsecret/meson.build
{% endblock %}

{% block meson_flags %}
manpage=false
gtk_doc=false
debugging=false
introspection=false
{% endblock %}

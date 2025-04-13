{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libgee
{% endblock %}

{% block version %}
0.20.8
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libgee/-/archive/{{self.version().strip()}}/libgee-{{self.version().strip()}}.tar.bz2
sha:fe3d412f206ba2603dc9f26cf14b9049d9311e745bff27bd93863c961c65f2f3
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_data %}
lib/glib/gir
lib/gi/repository/gir
{% endblock %}

{% block bld_tool %}
bld/gir
bin/vala/unwrap
bld/auto/archive
{% endblock %}

{% block make_flags %}
INTROSPECTION_SCANNER=g-ir-scanner
INTROSPECTION_COMPILER=g-ir-compiler
INTROSPECTION_MAKEFILE=${INTROSPECTION_MAKEFILE}
{% endblock %}

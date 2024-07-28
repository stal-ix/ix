{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libgee/-/archive/0.20.6/libgee-0.20.6.tar.bz2
sha:422966fa906f0e3bd6a5a1f8a13af4ecc835307c8ba8a6f313a0028fe0ab5ee7
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/build/vala
lib/gi/repository
{% endblock %}

{% block bld_tool %}
bld/gir
bin/vala/unwrap
bld/auto/archive
{% endblock %}

{% block make_flags %}
INTROSPECTION_SCANNER=g-ir-scanner
INTROSPECTION_COMPILER=g-ir-compiler
{% endblock %}

{% block postinstall %}
: #TODO(pg): proper place for gir/vaapi/vala files
{% endblock %}

{% block env %}
export VALAFLAGS="--vapidir=${out}/share/vala/vapi \${VALAFLAGS}"
{% endblock %}

{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libgtop/-/archive/2.40.0/libgtop-2.40.0.tar.bz2
sha:eed660785fb449df974a1fc18854fa2d44166b2889e085b3e6d9b946b0cc0203
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|.*gtkdocize.*||' -i autogen.sh
sed -e 's| doc||' -i Makefile.am
sed -e 's|0.19.4|0.21|' -e 's|doc/.*||' -e 's|GTK_DOC.*||' -i configure.ac
{% endblock %}

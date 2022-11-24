{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/gtkspell/3.0.10/gtkspell3-3.0.10.tar.xz
sha:b040f63836b347eb344f5542443dc254621805072f7141d49c067ecb5a375732
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/3
lib/enchant
{% endblock %}

{% block bld_tool %}
bld/vala
bld/gtkdoc
bld/gettext
bld/intltool
bld/auto/archive
bld/gobject/introspection
{% endblock %}

{% block patch %}
sed -e 's|exit 1|echo 1|' -i autogen.sh
{% endblock %}

{% extends '//die/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/5.4.2/gtksourceview-5.4.2.tar.bz2
sha:48b7e3bb91b85b605b874c39ea5c9a3f3601af31cbdcd333cc257fc9b318388d
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml2
lib/glib
lib/gtk/4
lib/pcre/2
lib/fribidi
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/xmllint
{% endblock %}

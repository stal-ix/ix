{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/ib/xarchiver/archive/refs/tags/0.5.4.18.tar.gz
sha:639889e052aad60c4a4ecacd607de3128ab765686570e93d954171ffdc22333e
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/gettext
bin/intltool
{% endblock %}

{% block configure_flags %}
--disable-doc
{% endblock %}

{% block c_rename_symbol %}
_caches
{% endblock %}

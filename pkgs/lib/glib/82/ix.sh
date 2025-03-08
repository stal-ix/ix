{% extends '//lib/glib/t/t/ix.sh' %}

{% block fetch %}
https://download.gnome.org/sources/glib/2.82/glib-2.82.4.tar.xz
sha:37dd0877fe964cd15e9a2710b044a1830fb1bd93652a6d0cb6b8b2dff187c709
{% endblock %}

{% block bld_tool %}
bld/meson/1
pip/packaging
{{super()}}
{% endblock %}

{% block strip_pc %}
{% endblock %}

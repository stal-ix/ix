{% extends '//die/c/meson.sh' %}

{% block version %}
dc898cac4d7075b45fe9294acb959b07cd7ecf6a
{% endblock %}

{% block pkg_name %}
xdg-desktop-portal
{% endblock %}

{% block fetch %}
https://github.com/flatpak/xdg-desktop-portal/archive/{{self.version().strip()}}.tar.gz
6ef03771e58625b0fa041d33afdfb5f3b6b88c0243e8f43507a829e4640401bb
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/fuse/3
lib/json/glib
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block patch %}
sed -e 's|flatpak_required =.*|flatpak_required = false|' \
    -e 's|bwrap_required =.*|bwrap_required = false|'     \
    -i meson.build
{% endblock %}

{% block strip_pc %}
{% endblock %}

{% block c_rename_symbol %}
gvdb_table_free
gvdb_table_get_names
gvdb_table_get_raw_value
gvdb_table_get_table
gvdb_table_get_value
gvdb_table_has_value
gvdb_table_is_valid
gvdb_table_list
gvdb_table_new
gvdb_table_new_from_bytes
{% endblock %}

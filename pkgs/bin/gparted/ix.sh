{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gparted
{% endblock %}

{% block version %}
1.8.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/gparted/gparted/gparted-{{self.version().strip()}}/gparted-{{self.version().strip()}}.tar.gz
67388ac405f9fe92a40636cb03b0e1e0bb6403ad89ccc174b2ff190ef6f32349
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/glib
lib/intl
lib/parted
lib/gtk/3/mm
# libparted.a broken
lib/build/muldefs
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/intltool
{% endblock %}

{% block configure_flags %}
--disable-doc
{% endblock %}

{% block patch %}
sed -e 's|static_cast<PedPartitionFlag>( NULL )|static_cast<PedPartitionFlag>(0)|' -i src/GParted_Core.cc
{% endblock %}

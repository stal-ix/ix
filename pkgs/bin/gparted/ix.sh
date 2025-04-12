{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.7.0
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/gparted/gparted/gparted-{{self.version().strip()}}/gparted-{{self.version().strip()}}.tar.gz
sha:84ae3b9973e443a2175f07aa0dc2aceeadb1501e0f8953cec83b0ec3347b7d52
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

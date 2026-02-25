{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gparted
{% endblock %}

{% block version %}
1.8.0
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/gparted/gparted/gparted-{{self.version().strip()}}/gparted-{{self.version().strip()}}.tar.gz
f584ed4be7fd09c2cf6a784778a8540970d985f0ac8e5a7bd0628528a3ab5609
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

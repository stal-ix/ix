{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/gparted/gparted/gparted-1.6.0/gparted-1.6.0.tar.gz
sha:9b9f51b3ce494ddcb59a55e1ae6679c09436604e331dbf5a536d60ded6c6ea5b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/glib
lib/intl
lib/parted
lib/gtk/3/mm
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

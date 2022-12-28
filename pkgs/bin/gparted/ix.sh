{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/gparted/gparted/gparted-1.4.0/gparted-1.4.0.tar.gz
sha:e5293a792e53fdbeba29c4a834113cd9603d0d639330da931a468bf3687887be
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/glib
lib/intl
lib/parted
lib/gtk/3/mm
lib/shim/gnu
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/intltool
{% endblock %}

{% block configure_flags %}
--disable-nls
--disable-doc
{% endblock %}

{% block patch %}
sed -e 's|static_cast<PedPartitionFlag>( NULL )|static_cast<PedPartitionFlag>(0)|' -i src/GParted_Core.cc
{% endblock %}

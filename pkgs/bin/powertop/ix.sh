{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
powertop
{% endblock %}

{% block version %}
2.16
{% endblock %}

{% block fetch %}
https://github.com/fenrus75/powertop/archive/refs/tags/v{{self.version().strip()}}.tar.gz
cf37e565b958a64f1e3086daeab82d7959566a372d01d40d3904cbca95cdf3d2
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/kernel
lib/curses
lib/pci/utils
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/auto/archive
{% endblock %}

{% block patch %}
rm autogen.sh
sed -e 's|0.18.2|0.24|' -i configure.ac
{% endblock %}

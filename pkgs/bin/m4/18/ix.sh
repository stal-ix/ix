{% extends '//bin/m4/19/ix.sh' %}

{% block pkg_name %}
m4
{% endblock %}

{% block version %}
1.4.18
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/m4/m4-{{self.version().strip()}}.tar.xz
sha:f2c1e86ca0a404ff281631bdc8377638992744b175afb806e25871a24a934e07
https://raw.githubusercontent.com/macports/macports-ports/edf0ee1e2cf/devel/m4/files/secure_snprintf.patch
sha:57f972940a10d448efbd3d5ba46e65979ae4eea93681a85e1d998060b356e0d2
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/obstack
{% endblock %}

{% block bld_tool %}
bld/texinfo
{{super()}}
{% endblock %}

{% block patch %}
patch -p0 < ${src}/secure_snprintf.patch
{% endblock %}

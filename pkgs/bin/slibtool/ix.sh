{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
slibtool
{% endblock %}

{% block version %}
0.6.1
{% endblock %}

{% block fetch %}
https://git.midipix.org/slibtool/snapshot/slibtool-{{self.version().strip()}}.tar.bz2
sha:604cc0411411e543f0469b20a23cb4c3d14f416a7d49f69fad8aa8b7805d49a3
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/m4
{% endblock %}

{% block configure %}
{% if help %}
sh ./configure --help
exit 1
{% else %}
sh ./configure --prefix=${out}
{% endif %}
{% endblock %}

{% block env %}
export LIBTOOL=slibtool-static
{% endblock %}

{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
slibtool
{% endblock %}

{% block version %}
0.7.1
{% endblock %}

{% block fetch %}
https://git.midipix.org/slibtool/snapshot/slibtool-{{self.version().strip()}}.tar.bz2
sha:fca3d2f99ce132ce5e2f7bdac3898dc598270c374ceb57e66984b2b9b94a504e
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

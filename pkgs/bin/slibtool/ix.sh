{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
slibtool
{% endblock %}

{% block version %}
0.7.0
{% endblock %}

{% block fetch %}
https://git.midipix.org/slibtool/snapshot/slibtool-{{self.version().strip()}}.tar.bz2
sha:8f3775825bdd7b629b5c07745eea6ffa13d8a08a92d8f0840c85b23026fb90c0
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

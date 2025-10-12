{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
slibtool
{% endblock %}

{% block version %}
0.7.4
{% endblock %}

{% block fetch %}
https://git.midipix.org/slibtool/snapshot/slibtool-{{self.version().strip()}}.tar.bz2
699f36513ba785c1981cb929d3654074b040139efbba8c0cd1ba69edb8770bf1
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

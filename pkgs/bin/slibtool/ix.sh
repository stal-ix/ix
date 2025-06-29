{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
slibtool
{% endblock %}

{% block version %}
0.7.3
{% endblock %}

{% block fetch %}
https://git.midipix.org/slibtool/snapshot/slibtool-{{self.version().strip()}}.tar.bz2
d5d847c350b3025642eb21f6079ecb858192e8e855be5dc1c9cf75a8affc5365
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

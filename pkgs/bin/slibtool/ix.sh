{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://git.midipix.org/slibtool/snapshot/slibtool-0.5.34.tar.bz2
sha:2b6f9a965b266c0dfbd6bb70915ce869fa8859d9470b65ebdfe847c8c6dd9507
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

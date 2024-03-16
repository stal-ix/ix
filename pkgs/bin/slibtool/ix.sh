{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://git.midipix.org/slibtool/snapshot/slibtool-0.5.35.tar.bz2
sha:2a236d527b35e52317c1503512779f7b129ca1f6b14d32c11b8dd023d5568702
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

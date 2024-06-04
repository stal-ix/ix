{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://git.midipix.org/slibtool/snapshot/slibtool-0.6.0.tar.bz2
sha:f4fd554da3744ddf356ae391ed3385054cbbee6ff6df86da20cd23479604d621
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

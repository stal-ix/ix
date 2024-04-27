{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://cdn.openbsd.org/pub/OpenBSD/OpenNTPD/openntpd-6.8p1.tar.gz
sha:8582db838a399153d4a17f2a76518b638cc3020f58028575bf54127518f55a46
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}

{% block c_rename_symbol %}
__progname
{% endblock %}

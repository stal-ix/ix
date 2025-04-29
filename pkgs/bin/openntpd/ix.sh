{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
OpenNTPD
{% endblock %}

{% block version %}
6.8p1
{% endblock %}

{% block fetch %}
https://cdn.openbsd.org/pub/OpenBSD/OpenNTPD/openntpd-{{self.version().strip()}}.tar.gz
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

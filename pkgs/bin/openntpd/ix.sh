{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
OpenNTPD
{% endblock %}

{% block version %}
7.9p1
{% endblock %}

{% block fetch %}
https://cdn.openbsd.org/pub/OpenBSD/OpenNTPD/openntpd-{{self.version().strip()}}.tar.gz
091eeb3f4e358e28c3ab2ea58f93d7a0b5758a20d7c8a0418e162e9b2c27addc
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

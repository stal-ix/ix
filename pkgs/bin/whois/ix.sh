{% extends '//die/c/make.sh' %}

{% block pkg_name %}
whois
{% endblock %}

{% block version %}
5.6.6
{% endblock %}

{% block fetch %}
https://github.com/rfc1036/whois/archive/refs/tags/v{{self.version().strip()}}.tar.gz
43d3b3cc64c75e8bd10aee6feff3906e9488ed335076d206e70f3b25bf644969
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bld/gettext
bld/pkg/config
{% endblock %}

{% block make_flags %}
BASHCOMPDIR=${out}/share/completion
{% endblock %}

{% block patch %}
sed -e 's|__attribute__((malloc(free)))||' -i utils.h
{% endblock %}

{% extends '//die/c/make.sh' %}

{% block pkg_name %}
whois
{% endblock %}

{% block version %}
5.6.4
{% endblock %}

{% block fetch %}
https://github.com/rfc1036/whois/archive/refs/tags/v{{self.version().strip()}}.tar.gz
95a3320940dbc1843c427ea85e7cc5e1d711692429fff4be23fadecd66cb9d24
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

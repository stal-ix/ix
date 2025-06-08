{% extends '//die/c/make.sh' %}

{% block pkg_name %}
whois
{% endblock %}

{% block version %}
5.6.2
{% endblock %}

{% block fetch %}
https://github.com/rfc1036/whois/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:0773cf51fc9a980af3954fb3859c7673f8bb7901c5be4041a12c926609edeb89
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

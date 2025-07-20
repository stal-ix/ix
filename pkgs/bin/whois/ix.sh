{% extends '//die/c/make.sh' %}

{% block pkg_name %}
whois
{% endblock %}

{% block version %}
5.6.3
{% endblock %}

{% block fetch %}
https://github.com/rfc1036/whois/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5bdaf291465ef185384d9b5c4482f377a8040c008433b51d3cb8a4627f7aab14
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

{% extends '//die/c/make.sh' %}

{% block version %}
5.5.23
{% endblock %}

{% block fetch %}
https://github.com/rfc1036/whois/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:dcfc08f3362c74ec8ae30691941909ebccf0cb3d27da04236f7e2790dbc7757c
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

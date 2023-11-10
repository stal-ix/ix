{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rfc1036/whois/archive/refs/tags/v5.5.20.tar.gz
sha:c15d527cad54a9d681415840060581b9d349e017b582fd575ee0f3133a1deef4
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

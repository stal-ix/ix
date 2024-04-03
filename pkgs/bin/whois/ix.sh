{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rfc1036/whois/archive/refs/tags/v5.5.22.tar.gz
sha:b7de4288700951b141420e2b4408f0906eaf4e97409cf5043aee80ef4d31e2b4
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

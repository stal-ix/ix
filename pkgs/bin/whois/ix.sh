{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rfc1036/whois/archive/refs/tags/v5.5.21.tar.gz
sha:4366a1c5e0e3e3e696de833bfa2620f8107d8fec9fc044c4a616eb805b08cc77
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

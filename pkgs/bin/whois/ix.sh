{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rfc1036/whois/archive/refs/tags/v5.5.19.tar.gz
sha:58602ce405a0d1f62fc99cd9e9e8cb3fb1ce05451a45a8d5b532bab5120d070e
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

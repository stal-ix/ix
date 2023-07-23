{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rfc1036/whois/archive/refs/tags/v5.5.18.tar.gz
sha:f0ecc280b5c7130dd8fe4bd7be6acefe32481a2c29aacb1f5262800b6c79a01b
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

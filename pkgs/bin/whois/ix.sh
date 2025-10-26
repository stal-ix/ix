{% extends '//die/c/make.sh' %}

{% block pkg_name %}
whois
{% endblock %}

{% block version %}
5.6.5
{% endblock %}

{% block fetch %}
https://github.com/rfc1036/whois/archive/refs/tags/v{{self.version().strip()}}.tar.gz
99510048033408eae5cc3f1f421121a1f33147196b7017ebaace6e56352680f5
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

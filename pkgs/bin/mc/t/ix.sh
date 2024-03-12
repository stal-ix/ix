{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/MidnightCommander/mc/archive/refs/tags/4.8.31.tar.gz
sha:53be761b505f539ab1ba5d112734628667b8abb06de75a04953b0ffce71548b7
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/glib
lib/iconv
{% endblock %}

{% block bld_tool %}
bld/perl
bld/gettext
{% endblock %}

{% block c_rename_symbol1 %}
tilde_expand
update_panels
{% endblock %}

{% block build_flags %}
shut_up
fix_shebangs
{% endblock %}

{% block configure_flags %}
--sysconfdir=${out}/share
--with-search-engine=glib
{% endblock %}

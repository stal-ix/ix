{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/MidnightCommander/mc/archive/refs/tags/4.8.32.tar.gz
sha:5b8e6a66b53f67a430296e3e490c00af17cbbb449f6c56f406ff02a11d516ba1
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

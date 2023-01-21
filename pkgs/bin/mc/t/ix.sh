{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/MidnightCommander/mc/archive/refs/tags/4.8.29.tar.gz
sha:09c8b9689d065e5a59d380338ed0bc0d529b3dcab860a40655333928a2b2e0ba
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
{% endblock %}

{% block configure_flags %}
--with-search-engine=glib
{% endblock %}

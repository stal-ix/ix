{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mc
{% endblock %}

{% block version %}
4.8.33
{% endblock %}

{% block fetch %}
https://github.com/MidnightCommander/mc/archive/refs/tags/{{self.version().strip()}}.tar.gz
092e440930fda43574739e45a8b41af384b974e6720184b6707d127b84082c51
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

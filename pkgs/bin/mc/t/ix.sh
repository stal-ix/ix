{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/MidnightCommander/mc/archive/refs/tags/4.8.29-pre1.tar.gz
sha:48e7fcd8433990b4df5c2579fb577f7ef95062ed3d8b206a0ca7ca37477fb1f5
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

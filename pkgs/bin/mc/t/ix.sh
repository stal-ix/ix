{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/MidnightCommander/mc/archive/refs/tags/4.8.30.tar.gz
sha:6f17de6c380ad4e8b71b31c3e9e3a6bae8cb05f08d42d8896dd26e269ceeb387
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

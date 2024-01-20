{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/emacs-mirror/emacs/archive/refs/tags/emacs-29.2.tar.gz
sha:9e4292882123ce698dde68bfde69ad141bca7e304e75a52e558575f59f0baf34
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/acl
lib/gmp
lib/gnutls
lib/curses
lib/jansson
lib/sqlite/3
{% endblock %}

{% block purge_autohell %}configure{% endblock %}

{% block bld_tool %}
bin/gzip
bld/gettext
bld/texinfo
{% endblock %}

{% block configure_flags %}
--with-gmp
--with-json
--without-x
--without-ns
--without-modules
--with-dumping=pdumper
{% endblock %}

{% block c_rename_symbol %}
hash_lookup
hash_string
{% endblock %}

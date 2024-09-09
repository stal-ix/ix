{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/emacs-mirror/emacs/archive/refs/tags/emacs-29.4.tar.gz
sha:b4e7faa61e17b29f5490c452a927f4a4253a38e171c6a54105b4ba4c216d6c5c
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
bin/tex/info
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
insert_string
{% endblock %}

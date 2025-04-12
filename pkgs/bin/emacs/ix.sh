{% extends '//die/c/autorehell.sh' %}

{% block version %}
30.1
{% endblock %}

{% block fetch %}
https://github.com/emacs-mirror/emacs/archive/refs/tags/emacs-{{self.version().strip()}}.tar.gz
sha:459e0524b1a5db42cd06c99be21d93d09768d2c3e642a1d1a9d239caea35384a
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

{% block cpp_defines %}
memset_explicit=memset
{% endblock %}

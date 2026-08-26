{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
emacs
{% endblock %}

{% block version %}
31.1
{% endblock %}

{% block fetch %}
https://github.com/emacs-mirror/emacs/archive/refs/tags/emacs-{{self.version().strip()}}.tar.gz
59fc9b553526453f8d7ded9f8d3857c047f4670ff417f18d906f0f66c0563110
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux/headers
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

{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.40.tar.bz2
sha:1164b29a75e8ab93ea15033300149e1872a7ef6bdda3d7c78229a735f8204c28
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/npth
lib/ksba
lib/bzip/2
lib/gnutls
lib/assuan
lib/gcrypt
lib/sqlite/3
lib/readline
lib/gpg/error
lib/shim/extra
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block patch %}
sed -e 's|ks_ldap_free_state.*||' -i dirmngr/server.c
{% endblock %}

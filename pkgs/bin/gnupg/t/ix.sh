{% extends '//die/c/autohell.sh' %}

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

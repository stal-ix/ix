{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.8.tar.bz2
sha:540b7a40e57da261fb10ef521a282e0021532a80fd023e75fb71757e8a4969ed
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
{% endblock %}

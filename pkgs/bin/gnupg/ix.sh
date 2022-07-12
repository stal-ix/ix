{% extends '//die/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.7.tar.bz2
sha:ee163a5fb9ec99ffc1b18e65faef8d086800c5713d15a672ab57d3799da83669
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
lib/sqlite3
lib/readline
lib/gpg/error
{% endblock %}

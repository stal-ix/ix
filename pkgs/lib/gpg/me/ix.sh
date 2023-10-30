{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.23.1.tar.bz2
sha:a0c316f7ab7d3bfb01a8753c3370dc906e5b61436021f3b54ff1483b513769bd
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/assuan
lib/gpg/error
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-glibtest
--disable-gpgconf-test
--disable-gpg-test
--disable-gpgsm-test
--disable-g13-test
{% endblock %}

{% block bld_tool %}
bin/gnupg
bld/texinfo
{% endblock %}

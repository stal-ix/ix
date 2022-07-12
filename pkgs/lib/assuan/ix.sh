{% extends '//die/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.5.tar.bz2
sha:8e8c2fcc982f9ca67dcbb1d95e2dc746b1739a4668bc20b3a3c5be632edb34e4
{% endblock %}

{% block lib_deps %}
lib/c
lib/gpg/error
{% endblock %}

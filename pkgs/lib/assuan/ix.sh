{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.5.tar.bz2
sha:8e8c2fcc982f9ca67dcbb1d95e2dc746b1739a4668bc20b3a3c5be632edb34e4
{% endblock %}

{% block lib_deps %}
lib/c
lib/gpg/error
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block postinstall %}
echo 'left config script'
{% endblock %}

{% block env %}
export COFLAGS="--with-libassuan-prefix=${out} \${COFLAGS}"
{% endblock %}

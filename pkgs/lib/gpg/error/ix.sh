{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.46.tar.bz2
sha:b7e11a64246bbe5ef37748de43b245abd72cfcd53c9ae5e7fc5ca59f1c81268d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--enable-install-gpg-error-config
{% endblock %}

{% block postinstall %}
echo 'need it for libassuan(and others) autoconf'
{% endblock %}

{% block env %}
export COFLAGS="--with-libgpg-error-prefix=${out} \${COFLAGS}"
{% endblock %}

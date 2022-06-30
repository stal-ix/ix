{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://www.bytereef.org/software/mpdecimal/releases/mpdecimal-2.5.1.tar.gz
sha:9f9cd4c041f99b5c49ffb7b59d9f12d95b683d88585608aa56a6307667b2b21f
{% endblock %}

{% block configure_flags %}
--enable-cxx=no
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-system-libmpdec=yes --with-libmpdec-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

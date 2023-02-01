{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://archive.apache.org/dist/apr/apr-util-1.6.2.tar.bz2
sha:4fe57443a7905027e13707c875c5de6f9fc6e2e5a2725d695b25a8a10c2d27e0
{% endblock %}

{% block lib_deps %}
lib/c
lib/apr
lib/gdbm
lib/iconv
lib/expat
lib/openssl
lib/sqlite/3
{% endblock %}

{% block configure_flags %}
--with-dbm=gdbm
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-apr-util=${out}/lib/bin/apu-1-config \${COFLAGS}"
{% endblock %}

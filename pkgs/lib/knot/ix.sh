{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://secure.nic.cz/files/knot-dns/knot-3.2.9.tar.xz
sha:bc1f9eb8c9f67f52805f3acfa2d0153190245fa145b007fafa9068d2da292506
{% endblock %}

{% block lib_deps %}
lib/c
lib/lmdb
lib/gnutls
{% endblock %}

{% block configure_flags %}
--disable-daemon
--disable-modules
--disable-utilities
--disable-fastparser
--disable-documentation
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block setup %}
export OPTFLAGS="${OPTFLAGS} -O0"
{% endblock %}

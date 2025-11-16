{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/coreutils/coreutils-9.9.tar.gz
91a719fcf923de686016f2c8d084a8be1f793f34173861273c4668f7c65af94a
{% endblock %}

{% block bld_libs %}
lib/tiny
lib/kernel
lib/musl/env
{% endblock %}

{% block configure_flags %}
--enable-install-program=timeout
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp src/timeout ${out}/bin/
{% endblock %}

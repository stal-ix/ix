{% extends '//die/autohell.sh' %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.1.tar.bz2
sha:ef14ae546b0084cd84259f61a55e07a38c3b53afc0f546bffcef2f01baffe9de
{% endblock %}

{% block lib_deps %}
lib/c
lib/gpg/error
{% endblock %}

{% block setup %}
export OPTFLAGS="${OPTFLAGS} -O2"
{% endblock %}

{% block patch %}
sed -e 's|#error|#warning|' -i random/jitterentropy-base.c
{% endblock %}

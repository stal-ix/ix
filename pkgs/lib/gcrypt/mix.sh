{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.4.tar.bz2
edc7becfe09c75d8f95ff7623e40c52e
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

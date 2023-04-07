{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.10.2.tar.bz2
sha:3b9c02a004b68c256add99701de00b383accccf37177e0d6c58289664cce0c03
{% endblock %}

{% block lib_deps %}
lib/c
lib/gpg/error
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block setup %}
export OPTFLAGS="${OPTFLAGS} -O2"
{% endblock %}

{% block patch %}
sed -e 's|#error|#warning|' -i random/jitterentropy-base.c
{% endblock %}

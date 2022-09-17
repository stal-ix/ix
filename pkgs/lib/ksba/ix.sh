{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.1.tar.bz2
sha:40750864c3ca11fa0833227938db6603661f6c1a3cc267485e81fa140cc6ea04
{% endblock %}

{% block lib_deps %}
lib/c
lib/gpg/error
{% endblock %}

{% block bld_tool %}
bld/bash
bld/bison
{% endblock %}

{% block postinstall %}
echo 'left bin/*config'
{% endblock %}

{% block env %}
export COFLAGS="--with-libksba-prefix=${out} \${COFLAGS}"
{% endblock %}

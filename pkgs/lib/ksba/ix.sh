{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.2.tar.bz2
sha:fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971
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

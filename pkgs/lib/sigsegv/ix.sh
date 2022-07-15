{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.13.tar.gz
sha:be78ee4176b05f7c75ff03298d84874db90f4b6c9d5503f0da1226b3a3c48119
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block env %}
export COFLAGS="--with-libsigsegv --with-libsigsegv-prefix=${out} \${COFLAGS}"
{% endblock %}

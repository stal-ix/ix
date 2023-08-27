{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.thrysoee.dk/editline/libedit-20230827-3.1.tar.gz
sha:fbe1a95a49ad344cc4108cba4164258010fa4184164baa9a22b9360ce8720c3c
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block env %}
export COFLAGS="--with-libedit=${out} \${COFLAGS}"
export CPPFLAGS="-I${out}/include/editline \${CPPFLAGS}"
{% endblock %}

{% block cpp_missing %}
stdint.h
{% endblock %}

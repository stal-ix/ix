{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libedit
{% endblock %}

{% block version %}
20260512-3.1
{% endblock %}

{% block fetch %}
https://www.thrysoee.dk/editline/libedit-{{self.version().strip()}}.tar.gz
432d5e7ea8b0116dd39f2eca7bc11d0eed77faa6b77ea526ace89907c23ea4a0
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

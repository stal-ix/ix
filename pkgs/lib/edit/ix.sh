{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libedit
{% endblock %}

{% block version %}
20250104-3.1
{% endblock %}

{% block fetch %}
https://www.thrysoee.dk/editline/libedit-{{self.version().strip()}}.tar.gz
23792701694550a53720630cd1cd6167101b5773adddcb4104f7345b73a568ac
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

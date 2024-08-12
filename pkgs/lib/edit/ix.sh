{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.thrysoee.dk/editline/libedit-20240808-3.1.tar.gz
sha:5f0573349d77c4a48967191cdd6634dd7aa5f6398c6a57fe037cc02696d6099f
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

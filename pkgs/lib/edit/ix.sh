{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://www.thrysoee.dk/editline/libedit-20210910-3.1.tar.gz
648946c97eb92daed5ca0d08bbd5e6a2
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libedit=${out} \${COFLAGS}"
export CPPFLAGS="-I${out}/include/editline \${CPPFLAGS}"
{% endblock %}

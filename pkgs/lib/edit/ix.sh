{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.thrysoee.dk/editline/libedit-20210910-3.1.tar.gz
sha:6792a6a992050762edcca28ff3318cdb7de37dccf7bc30db59fcd7017eed13c5
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libedit=${out} \${COFLAGS}"
export CPPFLAGS="-I${out}/include/editline \${CPPFLAGS}"
{% endblock %}

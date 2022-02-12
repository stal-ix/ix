{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://www.thrysoee.dk/editline/libedit-20210910-3.1.tar.gz
648946c97eb92daed5ca0d08bbd5e6a2
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block cpp_defines %}
__STDC_ISO_10646__=1
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libedit=${out} \${COFLAGS}"
{% endblock %}

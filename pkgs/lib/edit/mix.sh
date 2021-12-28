{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://thrysoee.dk/editline/libedit-20210522-3.1.tar.gz
6ad9e9208daf031adf1ebc64441769e0
{% endblock %}

{% block lib_deps %}
lib/c
lib/curses
{% endblock %}

{% block setup %}
export CPPFLAGS="-D__STDC_ISO_10646__=1 ${CPPFLAGS}"
{% endblock %}

{% block env %}
export COFLAGS="--with-libedit=${out} \${COFLAGS}"
{% endblock %}

{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url http://thrysoee.dk/editline/libedit-20210522-3.1.tar.gz
# md5 6ad9e9208daf031adf1ebc64441769e0
{% endblock %}

{% block deps %}
# lib lib/ncurses
# bld dev/build/make env/std
{% endblock %}

{% block cflags %}
export CPPFLAGS="-D__STDC_ISO_10646__=1 ${CPPFLAGS}"
{% endblock %}

{% block env %}
export COFLAGS="--with-libedit=${out} \${COFLAGS}"
export LDFLAGS="-L${out}/lib -ledit \${LDFLAGS}"
{% endblock %}

{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/Juniper/libxo/archive/refs/tags/1.6.0.tar.gz
# md5 6d29d5ca45cb469b9ccd3bb962dbee5a
{% endblock %}

{% block deps %}
# lib {{'lib/bsd' | linux}}
# bld dev/build/automake/1.16.3 dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block autoreconf %}
dash ./bin/setup.sh
{% endblock %}

{% block cflags %}
export CPPFLAGS="-I${lib_bsd}/include/bsd -DLIBBSD_OVERLAY=1 ${CPPFLAGS}"
{% endblock %}

{% block patch %}
cat libxo/xo_syslog.c | grep -v 'sysctl.h' > _ && mv _ libxo/xo_syslog.c
{% endblock %}

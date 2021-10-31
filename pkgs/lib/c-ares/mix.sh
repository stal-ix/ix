{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://c-ares.haxx.se/download/c-ares-1.17.2.tar.gz
# md5 3802264830c6886411dac606c66fdbf8
{% endblock %}

{% block deps %}
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block coflags %}
--disable-tests
{% endblock %}

{% block env %}
export COFLAGS="--with-ares=${out} --enable-ares=${out} \${COFLAGS}"
export LDFLAGS="-lresolv \${LDFLAGS}"
{% endblock %}

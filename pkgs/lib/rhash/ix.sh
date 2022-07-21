{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rhash/RHash/archive/refs/tags/v1.4.3.tar.gz
sha:1e40fa66966306920f043866cbe8612f4b939b033ba5e2708c3f41be257c8a3e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure \
    --enable-static \
    --enable-lib-static \
    --disable-lib-shared \
    --prefix=${out}
{% endblock %}

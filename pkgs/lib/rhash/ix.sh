{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rhash/RHash/archive/refs/tags/v1.4.4.tar.gz
sha:8e7d1a8ccac0143c8fe9b68ebac67d485df119ea17a613f4038cda52f84ef52a
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

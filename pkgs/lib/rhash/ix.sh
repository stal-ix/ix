{% extends '//die/c/make.sh' %}

{% block pkg_name %}
RHash
{% endblock %}

{% block version %}
1.4.6
{% endblock %}

{% block fetch %}
https://github.com/rhash/RHash/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:9f6019cfeeae8ace7067ad22da4e4f857bb2cfa6c2deaa2258f55b2227ec937a
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

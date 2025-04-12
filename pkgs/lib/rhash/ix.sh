{% extends '//die/c/make.sh' %}

{% block version %}
1.4.5
{% endblock %}

{% block fetch %}
https://github.com/rhash/RHash/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:6db837e7bbaa7c72c5fd43ca5af04b1d370c5ce32367b9f6a1f7b49b2338c09a
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

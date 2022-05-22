{% extends '//die/make.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/stalld/stalld.git/snapshot/stalld-1.15.0.tar.gz
sha:94cd22bbbb2b69044dbcfb2f1176b6d9a6f0dbc3b09f25c3d1f253644c60ec62
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% block patch %}
find . -name '*.c' -type f | while read l; do
    sed -e 's|.*on_exit(.*||' -e 's|pthread_attr_setaffinity_np.*|0;|' -i ${l}
done

sed -e 's|/usr/|/|' -i Makefile
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
{% endblock %}

{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/stalld/stalld.git/snapshot/stalld-1.17.1.tar.gz
sha:e7cccf63eb721bf50f7d978178d66b2eceebc24d0d8aabff7b118b768c027be7
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

{% extends '//die/make.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/stalld/stalld.git/snapshot/stalld-1.17.0.tar.gz
sha:07ee5cb8a8277edfbf15a77fec5184493f6ebb5dad9c25b13e11f2df78ea3d07
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

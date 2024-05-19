{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/stalld/stalld.git/snapshot/stalld-1.19.3.tar.gz
sha:89ad3659240b3063a9369c96ef9d410c649d539cdb5b2f3300a2baeb87de735c
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/shim/exit
{% endblock %}

{% block patch %}
find . -name '*.c' -type f | while read l; do
    sed -e 's|pthread_attr_setaffinity_np.*|0;|' -i ${l}
done

sed -e 's|/usr/|/|' -i Makefile
{% endblock %}

{% block make_flags %}
USE_BPF=0
DESTDIR=${out}
{% endblock %}

{% block cpp_missing %}
pthread.h
unistd.h
sys/types.h
sys/stat.h
fcntl.h
sched.h
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE
{% endblock %}

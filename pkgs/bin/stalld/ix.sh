{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/stalld/stalld.git/snapshot/stalld-1.19.1.tar.gz
sha:44f90b935080835b017a6cca6fa8ba8336b66fe2f799495b64a4a92f24f61d59
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

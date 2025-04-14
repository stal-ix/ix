{% extends '//die/c/make.sh' %}

{% block pkg_name %}
stalld
{% endblock %}

{% block version %}
1.19.4
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/utils/stalld/stalld.git/snapshot/stalld-{{self.version().strip()}}.tar.gz
sha:cc5c6ef7811da280931e33cdaf4e03b9acaf4bf3e6670e4de6cec593024d75a7
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
LDFLAGS=
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

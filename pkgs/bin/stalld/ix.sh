{% extends '//die/c/make.sh' %}

{% block pkg_name %}
stalld
{% endblock %}

{% block version %}
1.19.6
{% endblock %}

{% block fetch %}
https://gitlab.com/rt-linux-tools/stalld/-/archive/v{{self.version().strip()}}/stalld-v{{self.version().strip()}}.tar.bz2
7ecbb8fd7b2efd928ecbd1b3ce2b72cb7c486885f09f5ead15e1a5e0891c40e2
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

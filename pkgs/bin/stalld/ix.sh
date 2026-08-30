{% extends '//die/c/make.sh' %}

{% block pkg_name %}
stalld
{% endblock %}

{% block version %}
1.28.1
{% endblock %}

{% block fetch %}
https://gitlab.com/rt-linux-tools/stalld/-/archive/v{{self.version().strip()}}/stalld-v{{self.version().strip()}}.tar.bz2
c6143b5a667c308fe6d5ac0bddcb70ee3416379a5dc42673ffe6b5f2d24e8fef
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

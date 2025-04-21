{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ntirpc
{% endblock %}

{% block version %}
6.3
{% endblock %}

{% block fetch %}
https://github.com/nfs-ganesha/ntirpc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:6f97a9992961c49a7994fd94e866bacddfc00d9369493cf071be46b33c7dbac5
{% endblock %}

{% block lib_deps %}
lib/c
lib/urcu
lib/nsl/naked
bin/nfs/ganesha/cdefs
{% endblock %}

{% block cpp_missing %}
assert.h
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block patch %}
sed -e 's|.*pthread_mutexattr_settype.*||' -i ntirpc/reentrant.h
sed -e 's|__FreeBSD__|__linux__|' -i ntirpc/rpc/rpcent.h
sed -e 's|bits/endian.h|endian.h|' -i src/xdr_float.c
{% endblock %}

{% block env %}
export NTIRPC_PREFIX=${out}
export CPPFLAGS="-DBSDBASED=0 \${CPPFLAGS}"
{% endblock %}

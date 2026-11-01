{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ntirpc
{% endblock %}

{% block version %}
15.7
{% endblock %}

{% block fetch %}
https://github.com/nfs-ganesha/ntirpc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d4f2fda75dc2bad0a1bea0874dad4713dd9846ab54ebb3ef93687a44e71d9dff
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
wrap_rdynamic
{% endblock %}

{% block cmake_flags %}
USE_MONITORING=OFF
{% endblock %}

{% block patch %}
sed -e '/^SET(monitoring_SRCS/i if(USE_MONITORING)' \
    -e '/^add_executable(rpcping/i endif(USE_MONITORING)' \
    -i tests/CMakeLists.txt
sed -e 's|.*pthread_mutexattr_settype.*||' -i ntirpc/reentrant.h
sed -e 's|__FreeBSD__|__linux__|' -i ntirpc/rpc/rpcent.h
sed -e 's|bits/endian.h|endian.h|' -i src/xdr_float.c
{% endblock %}

{% block env %}
export NTIRPC_PREFIX=${out}
export CPPFLAGS="-DBSDBASED=0 \${CPPFLAGS}"
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ntirpc
{% endblock %}

{% block version %}
15.5
{% endblock %}

{% block fetch %}
https://github.com/nfs-ganesha/ntirpc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
881c98cc48e938e2f261faae7a098058cbbc9e824e9ebefd8c059fc2829ec23a
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

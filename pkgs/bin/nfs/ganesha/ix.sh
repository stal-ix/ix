{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
nfs-ganesha
{% endblock %}

{% block version %}
5.7
{% endblock %}

{% block git_repo %}
https://github.com/nfs-ganesha/nfs-ganesha
{% endblock %}

{% block git_branch %}
V{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
fab7138a6dd4d994111971ce18e2a44aebf97659f7567c0c910fc3cae57a8966
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/acl
lib/dbus
lib/urcu
lib/kernel
lib/ntirpc
lib/execinfo
lib/linux/util
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block step_unpack %}
{{super()}}
cd src
{% endblock %}

{% block cmake_flags %}
USE_GSS=OFF
USE_SYSTEM_NTIRPC=ON
NTIRPC_INCLUDE_DIR=${NTIRPC_PREFIX}/include/ntirpc
NTIRPC_LIBRARY_DIR=${NTIRPC_PREFIX}/lib
{% endblock %}

{% block patch %}
sed -e 's|typedef.*_t;||' -i include/nlm4.h
#sed -e 's|innetgr.*;|0;|' -i support/netgroup_cache.c
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

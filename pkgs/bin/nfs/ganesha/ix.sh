{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/nfs-ganesha/nfs-ganesha
{% endblock %}

{% block git_branch %}
V5.7
{% endblock %}

{% block git_sha %}
f9c2e5fd58dca78cfea4368ee705ffd526b478428e5a3be4ed521f7f9c606772
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/acl
lib/dbus
lib/urcu
lib/kernel
lib/execinfo
lib/linux/util
bin/nfs/ganesha/ntirpc
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

{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-6.0.3-RELEASE.tar.gz
sha:444c0de5fe18e148548a3f3b60b3bac3d4d586285c21064346c7ca17ed1d4fac
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/bsd
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/bsd/overlay
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
cat << EOF >> os/generic_unix_base.h
#pragma once

#if defined(__cplusplus)
    #define __BEGIN_DECLS extern "C" {
    #define __END_DECLS }
#else
    #define __BEGIN_DECLS
    #define __END_DECLS
#endif
EOF
{% endblock %}

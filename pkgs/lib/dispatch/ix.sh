{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libdispatch
{% endblock %}

{% block version %}
6.1.2
{% endblock %}

{% block fetch %}
https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-{{self.version().strip()}}-RELEASE.tar.gz
26e8f6d661415502c10f909835961cac4edf56a0ab9512a9988489fe98601385
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

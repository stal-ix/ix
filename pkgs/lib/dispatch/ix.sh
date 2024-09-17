{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-6.0-RELEASE.tar.gz
sha:fa6fe877cf88391d3faba14147ed5531871b424b28e854534f28e83fc77d2081
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

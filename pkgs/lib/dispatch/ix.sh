{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libdispatch
{% endblock %}

{% block version %}
6.1.1
{% endblock %}

{% block fetch %}
https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-{{self.version().strip()}}-RELEASE.tar.gz
sha:6fc6f8b1767a1348e1d960647b2bfbc52fd7074b7aeab97bd0f4b21af58baa47
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

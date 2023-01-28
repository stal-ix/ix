{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-5.7.3-RELEASE.tar.gz
sha:4c6b7b0ecdf10e9cbe1cd007b9a09689ea412edb8e3a289ade6d105df43209f5
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
#if !defined(skjhfsdhfjsdhgfk)
#define skjhfsdhfjsdhgfk

#if defined(__cplusplus)
    #define __BEGIN_DECLS extern "C" {
    #define __END_DECLS }
#else
    #define __BEGIN_DECLS
    #define __END_DECLS
#endif

#endif
EOF
{% endblock %}

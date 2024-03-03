{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/include/sys
cat << EOF > ${out}/include/sys/cdefs.h
#pragma once

#if defined(__cplusplus)
    #define __BEGIN_DECLS extern "C" {
    #define __END_DECLS }
#else
    #define __BEGIN_DECLS
    #define __END_DECLS
#endif

#define PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP PTHREAD_MUTEX_INITIALIZER
#define bool int
EOF
{% endblock %}

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

#define PTHREAD_MUTEX_ADAPTIVE_NP PTHREAD_MUTEX_DEFAULT
#define PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP PTHREAD_MUTEX_INITIALIZER
#define bool int
#define rresvport_af(a, b) -1
#define malloc_trim(x)
EOF

cat << EOF > ${out}/include/mcheck.h
#pragma once
EOF
{% endblock %}

{% block env %}
export CPPFLAGS="-include sys/cdefs.h \${CPPFLAGS}"
{% endblock %}

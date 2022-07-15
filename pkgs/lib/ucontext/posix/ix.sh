{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/ucontext
{% endblock %}

{% block install %}
mkdir -p ${out}/include/sys

cat << EOF > ${out}/include/ucontext.h
{% include 'ucontext.h' %}
EOF

cat << EOF > ${out}/include/sys/ucontext.h
#pragma once
#include <ucontext.h>
EOF
{% endblock %}

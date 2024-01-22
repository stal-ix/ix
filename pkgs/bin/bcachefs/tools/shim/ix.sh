{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/include/sys
cat << EOF > ${out}/include/sys/uio.h
#pragma once
#include_next <sys/uio.h>
#define pwritev2(a, b, c, d, e) pwritev(a, b, c, d)
EOF
{% endblock %}

{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block sources %}
ucontext.c
ucontext.h
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/include
mkdir sys
cat << EOF > sys/ucontext.h
#pragma once
#include <ucontext.h>
EOF
{% endblock %}

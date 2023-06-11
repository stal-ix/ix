{% extends '//die/proxy.sh' %}

{% block bld_tool %}
bld/genpc
{% endblock %}

{% block install %}
mkdir -p ${out}/include/GL
cat << EOF > ${out}/include/GL/glew.h
#pragma once
#include <GL/gl.h>
#define glewInit(...)
EOF
genpc glew "1.0.0"
{% endblock %}

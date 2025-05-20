{% extends '//die/gen.sh' %}

{% block lib_deps %}
lib/shim/fake/pkg(pkg_name=glew,pkg_ver=1.0.0)
{% endblock %}

{% block install %}
mkdir -p ${out}/include/GL
cat << EOF > ${out}/include/GL/glew.h
#pragma once
#include <GL/gl.h>
#define glewInit(...)
EOF
{% endblock %}

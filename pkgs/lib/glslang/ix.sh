{% extends '//lib/glslang/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_GLSLANG_BINARIES=OFF
{% endblock %}

{% block env %}
export CPPFLAGS="-DENABLE_OPT=1 -I${out}/include/glslang \${CPPFLAGS}"
{% endblock %}

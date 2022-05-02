{% extends '//lib/glslang/t/mix.sh' %}

{% block env %}
export CPPFLAGS="-DENABLE_OPT=1 -I${out}/include/glslang \${CPPFLAGS}"
{% endblock %}

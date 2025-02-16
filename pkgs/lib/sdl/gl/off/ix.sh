{% extends '//die/env.sh' %}

{% block env %}
export CMFLAGS="-DSDL_OPENGL=OFF -DSDL_OPENGLES=OFF ${CMFLAGS}"
{% endblock %}

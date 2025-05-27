{% extends '//die/env.sh' %}

{% block env %}
{% if 'mesa' in opengl %}
export CMFLAGS="-DSDL_OPENGL=ON -DSDL_OPENGLES=ON ${CMFLAGS}"
{% else %}
export CMFLAGS="-DSDL_OPENGL=OFF -DSDL_OPENGLES=ON ${CMFLAGS}"
{% endif %}
export CPPFLAGS="-DSDL_VIDEO_OPENGL_EGL=1 ${CPPFLAGS}"
{% endblock %}

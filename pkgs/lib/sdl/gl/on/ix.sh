{% extends '//die/env.sh' %}

{% block env %}
export CMFLAGS="-DSDL_OPENGL=ON -DSDL_OPENGLES=ON ${CMFLAGS}"
export CPPFLAGS="-DSDL_VIDEO_OPENGL_EGL=1 ${CPPFLAGS}"
{% endblock %}

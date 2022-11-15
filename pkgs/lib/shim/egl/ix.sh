{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/include/EGL
cat << EOF > ${out}/include/EGL/eglplatform.h
{% include 'eglplatform.h' %}
EOF
{% endblock %}

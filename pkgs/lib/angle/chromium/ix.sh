{% extends '//bin/chromium/unwrap/ix.sh' %}

{% block ninja_build_targets %}
libGLESv2.so
libEGL.so
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp ${tmp}/lib/*.a ${out}/lib/
{% endblock %}

{% block env %}
export ANGLE_DIR=${out}/lib
{% endblock %}

{% extends '//bin/chromium/unwrap/ix.sh' %}

{% block ninja_build_targets %}
libGLESv2.so
libEGL.so
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp ${tmp}/lib/*.a ${out}/lib/
{% endblock %}

{% block gn_args %}
{{super()}}
angle_enable_d3d9=false
angle_enable_d3d11=false
angle_enable_gl=false
angle_enable_metal=false
angle_enable_null=false
angle_enable_vulkan=true
angle_enable_essl=false
angle_enable_glsl=false
{% endblock %}

{% block env %}
export ANGLE_DIR=${out}/lib
{% endblock %}

{% block patch %}
{{super()}}
>third_party/wayland/src/src/wayland-client.c
>third_party/wayland/src/src/wayland-server.c
{% endblock %}

{% block c_rename_symbol %}
{% endblock %}

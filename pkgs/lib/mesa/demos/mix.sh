{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://archive.mesa3d.org/demos/mesa-demos-8.4.0.tar.bz2
6b65a02622765522176d00f553086fa3
{% endblock %}

{% block bld_libs %}
lib/drm
lib/mesa
lib/mesa/drivers/gl/zink
lib/vulkan/driver
lib/freetype
lib/freeglut
lib/wayland
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block configure_flags %}
--enable-egl=yes
--enable-gles2=yes
--enable-libdrm=yes
--enable-x11=no
--enable-wayland=yes
{% endblock %}

{% block setup %}
ln -s ${lib_mesa}/lib/libEGL.a ./libGL.a
export LDFLAGS="-L${PWD} ${LDFLAGS}"
export ac_cv_lib_GL_glBegin=yes
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

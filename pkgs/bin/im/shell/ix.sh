{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
imway
{% endblock %}

{% block git_repo %}
https://github.com/impulse-desktop/shell
{% endblock %}

{% block git_commit %}
3
{% endblock %}

{% block git_sha %}
f0f5158f1b4f8c785f43504b9e4b13f340b306c3479cf8ec5d980e7602746880
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/ev
lib/drm
lib/png
lib/jxl
lib/std
lib/dbus
lib/seat
lib/pam
lib/udev
lib/input
lib/lcms/2
lib/display/info
lib/sndio
lib/wayland
lib/lunasvg
lib/xkb/common
lib/vulkan/loader
lib/vulkan/drivers
lib/vulkan/headers
lib/wayland/protocols
{% endblock %}

{% block bld_tool %}
bld/wayland
bin/glslang
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp imway ${out}/bin/
{% endblock %}

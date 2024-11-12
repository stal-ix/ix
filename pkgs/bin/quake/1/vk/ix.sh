{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.31.3.tar.gz
sha:7fe42363e871e358b65115b49ddb5436fa6edb414d2cff3c4012eb0e4bbaf24f
{% endblock %}

{% block bld_libs %}
lib/c
lib/mad
lib/opus
lib/sdl/2
lib/kernel
lib/dbus/dl
lib/xiph/ogg
lib/opus/file
lib/xiph/flac
lib/drivers/3d
lib/xiph/vorbis
lib/vulkan/loader
bin/quake/1/vk/dl
{% endblock %}

{% block bld_tool %}
bin/glslang
bld/spirv/tools
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(find ${tmp} -type f -name vkquake) ${out}/bin/
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
vkQuake
{% endblock %}

{% block version %}
1.36.0
{% endblock %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/{{self.version().strip()}}.tar.gz
3dd1bd8c13e902db9c3d216ce065552cb975dfd8b1b17a21b49c5458eb8a306e
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
lib/xiph/vorbis
bin/quake/1/vk/dl
lib/vulkan/loader
lib/vulkan/headers
lib/vulkan/drivers
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/glslang/old
{% if linux %}
bin/muslstack
{% endif %}
bld/spirv/tools
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(find ${tmp} -type f -name vkquake) ${out}/bin/
{% if linux %}
muslstack -s 8388608 ${out}/bin/vkquake
{% endif %}
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
vkQuake
{% endblock %}

{% block version %}
1.37.0
{% endblock %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/{{self.version().strip()}}.tar.gz
955a7777ee9456973b1f3ea278d9f3b34538c788dc5938e42a734fad2e2d761a
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

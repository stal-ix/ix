{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
vkQuake
{% endblock %}

{% block version %}
1.32.3
{% endblock %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/{{self.version().strip()}}.tar.gz
75696a57fae258813a8ce256ed82f77c952f24c9108e4028cee55e70813cddf8
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

{% block bld_tool %}
bin/glslang
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

{% extends '//die/c/meson.sh' %}

{% block version %}
1.32.0
{% endblock %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:c9f5d305358fb44c5e0944c4f73d2d4887574178253ad092d11489925d7ef433
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

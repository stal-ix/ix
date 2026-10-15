{% extends '//die/c/pybuild.sh' %}

{% block pkg_name %}
shitty
{% endblock %}

{% block version %}
18
{% endblock %}

{% block fetch %}
https://github.com/pg83/shitty/archive/refs/tags/{{self.version().strip()}}.tar.gz
3761578b327abbed4a4ca5e6d8d799e932753b16f183736b5cd09c56a1113922
{% endblock %}

{% block pybuild_target %}
st pt
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/freetype
lib/harfbuzz
lib/simd/utf
lib/wayland
lib/fontconfig
lib/xkb/common
lib/linux/headers
lib/vulkan/loader
lib/vulkan/drivers
lib/vulkan/headers
lib/wayland/protocols
{% endblock %}

{% block bld_tool %}
bld/wayland
bin/glslang
bin/svg2png
bin/ragel/6
{% endblock %}

{% block install %}
sh dev/install.sh ${out}
{% endblock %}

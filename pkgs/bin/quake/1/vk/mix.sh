{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.13.1.tar.gz
sha:ceb9ee46135309f7caf94267539cae70b47ef8edf104e3901b89d3aee7b0b874
{% endblock %}

{% block unpack %}
{{super()}}
cd Quake
{% endblock %}

{% block bld_libs %}
lib/c
lib/mad
lib/sdl/2
lib/xiph/ogg
lib/xiph/flac
lib/drivers/3d
lib/xiph/vorbis
lib/vulkan/loader
{% endblock %}

{% block make_flags %}
bindir="${out}/bin"
{% endblock %}

{% block install %}
mkdir ${out}/bin
{{super()}}
{% endblock %}

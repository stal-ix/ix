{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.12.1.tar.gz
sha:8adbc27dd46962cd69165e84559b7bda8515ade381f22ba775c333440f2a2f32
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

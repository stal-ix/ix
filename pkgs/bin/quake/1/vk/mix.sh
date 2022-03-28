{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.13.0.tar.gz
sha:baeab4fbea17bb41064b56a7e6e745f2856634c88d57ad86de97990399c24b3b
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

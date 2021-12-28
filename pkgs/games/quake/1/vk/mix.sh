{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.12.1.tar.gz
7c090dd5e5e8bf3474addad4f1558d37
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
lib/xiph/vorbis
lib/vulkan/loader
lib/vulkan/driver
{% endblock %}

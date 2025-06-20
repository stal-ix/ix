{% extends '//die/c/make.sh' %}

{% block pkg_name %}
vkQuake2
{% endblock %}

{% block version %}
1.5.8
{% endblock %}

{# can not build without X #}

{% block fetch %}
https://github.com/kondrak/vkQuake2/archive/refs/tags/{{self.version().strip()}}.tar.gz
4c131047d8d341523f94061b7c8d1983fb34b43afa0a8532a1f6008a7709b1be
{% endblock %}

{% block unpack %}
{{super()}}
cd linux
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
sed -e 's|-x.*cpp||' -e 's|mixa.s|mixa.S|' -i Makefile
mv snd_mixa.s snd_mixa.S
{% endblock %}

{% block bld_libs %}
lib/c
lib/alsa
lib/sdl/2
lib/vulkan/loader
lib/vulkan/headers
lib/vulkan/drivers
{% endblock %}

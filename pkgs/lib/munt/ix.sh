{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libmt32emu
{% endblock %}

{% block version %}
2.8.4
{% endblock %}

{% block fetch %}
https://github.com/munt/munt/archive/refs/tags/libmt32emu_{{self.version().strip().replace('.', '_')}}.tar.gz
1080ee41fe1f9a2d9abc7ec010cb105a57576528708e3d0ef467b6a7d7fde92f
{% endblock %}

{% block step_unpack %}
{{super()}}
cd mt32emu
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

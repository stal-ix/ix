{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libmt32emu
{% endblock %}

{% block version %}
2.7.2
{% endblock %}

{% block fetch %}
https://github.com/munt/munt/archive/refs/tags/libmt32emu_{{self.version().strip().replace('.', '_')}}.tar.gz
3b0beff64e83d2b4879baba2326eed1300edc9663b3dc52621fc74d196ca9a80
{% endblock %}

{% block step_unpack %}
{{super()}}
cd mt32emu
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

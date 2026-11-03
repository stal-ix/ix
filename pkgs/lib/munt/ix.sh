{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libmt32emu
{% endblock %}

{% block version %}
2.8.5
{% endblock %}

{% block fetch %}
https://github.com/munt/munt/archive/refs/tags/libmt32emu_{{self.version().strip().replace('.', '_')}}.tar.gz
801fa771d7384dc462a626d16c8a4d5b9ff73921ff946ea1f042f1a569ee5e11
{% endblock %}

{% block step_unpack %}
{{super()}}
cd mt32emu
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

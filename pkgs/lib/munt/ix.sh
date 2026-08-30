{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libmt32emu
{% endblock %}

{% block version %}
2.8.3
{% endblock %}

{% block fetch %}
https://github.com/munt/munt/archive/refs/tags/libmt32emu_{{self.version().strip().replace('.', '_')}}.tar.gz
81f8c462f46bc8901618762ae34cf9de93894ff81f41db73c79472fa3baef875
{% endblock %}

{% block step_unpack %}
{{super()}}
cd mt32emu
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

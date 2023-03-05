{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/msgpack/msgpack-c/archive/refs/tags/c-6.0.0.tar.gz
sha:af6f3cf25edb220aa2140b09bb5bdd73ddf00938194bd94ebe5c92090cccb466
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
MSGPACK_BUILD_TESTS=OFF
MSGPACK_BUILD_EXAMPLES=OFF
{% endblock %}

{% block install %}
{{super()}}
# for neovim
cp ${out}/lib/libmsgpack-c.a ${out}/lib/libmsgpackc.a
{% endblock %}

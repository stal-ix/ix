{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/GrapheneOS/hardened_malloc/archive/refs/tags/11.tar.gz
sha:14331990899b91f9323230c280d66f0d1a77c386eb5d206d4cd0d8b5683098da
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block make_flags %}
CONFIG_CXX_ALLOCATOR=false
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp out/libhardened_malloc.so ${out}/lib/libhardened_malloc.a
{% endblock %}

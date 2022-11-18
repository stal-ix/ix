{% extends '//die/c/premake.sh' %}

{% block fetch %}
https://github.com/SpartanJ/efsw/archive/refs/tags/1.3.0.tar.gz
sha:e190b72f23d92c42e1a0dab9bb6354a56f75c7535fd1f3e3a10b1c317e05f8f6
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
-C make/linux
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cpp_missing %}
sys/select.h
{% endblock %}

{% block setup %}
export CPPFLAGS="-Du_int32_t=uint32_t ${CPPFLAGS}"
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bin/efsw* ${out}/bin/efsw
{% endblock %}

{% extends '//die/c/premake.sh' %}

{% block fetch %}
https://github.com/SpartanJ/efsw/archive/refs/tags/1.3.1.tar.gz
sha:3c0efe023258712d25644977227f07cf7edf7e5dc00ffa8d88733f424fa6af86
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

{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/Terraspace/UASM/archive/refs/tags/v2.56.2.tar.gz
sha:a624cf17cce9b11155aebb5b954b2a6d93052d7e2857284ba087c546442b5eeb
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block make_flags %}
-f Makefile_Linux
CC=clang
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_defines %}
inline=
{% endblock %}

{% block setup %}
export CFLAGS="-Wno-incompatible-function-pointer-types ${CFLAGS}"
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp GccUnixR/uasm ${out}/bin/
{% endblock %}

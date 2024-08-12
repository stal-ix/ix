{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/Terraspace/UASM/archive/refs/tags/v2.57r.tar.gz
sha:09fa69445f2af47551e82819d024e6b4b629fcfd47af4a22ccffbf37714230e5
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block make_flags %}
-f Makefile_Linux.mak
CC=clang
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_defines %}
inline=
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-incompatible-function-pointer-types ${CFLAGS}"
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp GccUnixR/uasm ${out}/bin/
{% endblock %}

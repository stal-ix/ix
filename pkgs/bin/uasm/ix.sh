{% extends '//die/c/make.sh' %}

{% block version %}
2.57r
{% endblock %}

{% block pkg_name %}
uasm
{% endblock %}

{% block fetch %}
https://github.com/Terraspace/UASM/archive/refs/tags/v{{self.version().strip()}}.tar.gz
09fa69445f2af47551e82819d024e6b4b629fcfd47af4a22ccffbf37714230e5
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

{% block c_flags %}
-Wno-incompatible-function-pointer-types
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp GccUnixR/uasm ${out}/bin/
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
jpegoptim
{% endblock %}

{% block version %}
1.5.6
{% endblock %}

{% block fetch %}
https://github.com/tjko/jpegoptim/archive/refs/tags/v{{self.version().strip()}}.tar.gz
661a808dfffa933d78c6beb47a2937d572b9f03e94cbaaab3d4c0d72f410e9be
{% endblock %}

{% block bld_libs %}
lib/c
lib/jpeg
{% endblock %}

{% block cmake_flags %}
USE_MOZJPEG=0
{% endblock %}

{% block cpp_missing %}
${PWD}/getopt.h
{% endblock %}

{% block cpp_defines %}
__GNU_LIBRARY__=1
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/jpegoptim ${out}/bin
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/tjko/jpegoptim/archive/refs/tags/v1.5.2.tar.gz
sha:e8701cc85c065e05747a15da72ebb403056ebecaa98e2806cf69cdd443397910
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

{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
jpegoptim
{% endblock %}

{% block version %}
1.5.5
{% endblock %}

{% block fetch %}
https://github.com/tjko/jpegoptim/archive/refs/tags/v{{self.version().strip()}}.tar.gz
90a309d1c092de358bb411d702281ac3039b489d03adb0bc3c4ef04cf0067d38
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

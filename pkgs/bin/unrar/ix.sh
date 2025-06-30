{% extends '//die/c/make.sh' %}

{% block pkg_name %}
unrar
{% endblock %}

{% block version %}
7.1.8
{% endblock %}

{% block fetch %}
https://www.rarlab.com/rar/unrarsrc-{{self.version().strip()}}.tar.gz
9ec7765a948140758af12ed29e3e47db425df79a9c5cbb71b28769b256a7a014
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block make_flags %}
-f makefile
CXXFLAGS=
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp unrar ${out}/bin/
{% endblock %}

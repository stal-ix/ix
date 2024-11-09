{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.rarlab.com/rar/unrarsrc-7.1.1.tar.gz
sha:2e9cbc9d1c250b40f4a7a6a363b6ccfa3703e190534979d18c8c4ac5ae35dafc
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

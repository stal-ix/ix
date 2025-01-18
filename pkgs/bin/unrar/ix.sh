{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.rarlab.com/rar/unrarsrc-7.1.3.tar.gz
sha:f7edb6f55fb53611206781d9e56f2625ef4411a6b129768800196617d9df920a
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

{% extends '//die/c/make.sh' %}

{% block pkg_name %}
unrar
{% endblock %}

{% block version %}
7.1.7
{% endblock %}

{% block fetch %}
https://www.rarlab.com/rar/unrarsrc-{{self.version().strip()}}.tar.gz
sha:e86ae4f1f33a13752146f41e961c57f12f0ee01580ac188ec8cc43da5c22ae92
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

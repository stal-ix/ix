{% extends '//die/c/make.sh' %}

{% block pkg_name %}
unrar
{% endblock %}

{% block version %}
7.1.10
{% endblock %}

{% block fetch %}
https://www.rarlab.com/rar/unrarsrc-{{self.version().strip()}}.tar.gz
72a9ccca146174f41876e8b21ab27e973f039c6d10b13aabcb320e7055b9bb98
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

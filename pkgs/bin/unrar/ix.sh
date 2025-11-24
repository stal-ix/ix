{% extends '//die/c/make.sh' %}

{% block pkg_name %}
unrar
{% endblock %}

{% block version %}
7.2.2
{% endblock %}

{% block fetch %}
https://www.rarlab.com/rar/unrarsrc-{{self.version().strip()}}.tar.gz
41c00c8755cf5bf6b5d7f0d2d167ee889c2c5352e17e5c9470dbc354af1e71ab
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

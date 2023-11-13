{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.rarlab.com/rar/unrarsrc-7.0.3.tar.gz
sha:2df43254f8132937d409934673755e76152357045468af87331c7b5fe48cced4
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

{% extends '//mix/make.sh' %}

{% block fetch %}
https://www.rarlab.com/rar/unrarsrc-6.1.7.tar.gz
sha:de75b6136958173fdfc530d38a0145b72342cf0d3842bf7bb120d336602d88ed
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block make_flags %}
-f makefile
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp unrar ${out}/bin/
{% endblock %}

{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.rarlab.com/rar/unrarsrc-6.2.7.tar.gz
sha:f071169f3f20a564f9cf1c8976c64e72de3b9cdbcccaa43a0c66472eb737aa01
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

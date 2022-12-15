{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.rarlab.com/rar/unrarsrc-6.2.3.tar.gz
sha:120936e41f826cd63d77a580aeea64c1b79fd3e2434f58ce8184e783b51e5b01
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

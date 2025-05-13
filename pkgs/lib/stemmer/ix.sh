{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libstemmer_c
{% endblock %}

{% block version %}
3.0.1
{% endblock %}

{% block fetch %}
https://snowballstem.org/dist/libstemmer_c-{{self.version().strip()}}.tar.gz
sha:419db89961cf2e30e6417265a4f3c903632d47d6917e7f8c6ae0e4d998743aad
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
cp -R include ${out}/
mkdir ${out}/lib
cp *.a ${out}/lib/
{% endblock %}

{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libstemmer_c
{% endblock %}

{% block version %}
3.2.0
{% endblock %}

{% block fetch %}
https://snowballstem.org/dist/libstemmer_c-{{self.version().strip()}}.tar.gz
561a8864a7dd6a366c0faca88d76b516d844a8b4505949a1dc43cd21bb76eea2
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
cp -R include ${out}/
mkdir ${out}/lib
cp *.a ${out}/lib/
{% endblock %}

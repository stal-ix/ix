{% extends '//die/c/make.sh' %}

{% block version %}
2.2.0
{% endblock %}

{% block fetch %}
https://snowballstem.org/dist/libstemmer_c-{{self.version().strip()}}.tar.gz
sha:b941d9fe9cf36b4e2f8d3873cd4d8b8775bd94867a1df8d8c001bb8b688377c3
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
cp -R include ${out}/
mkdir ${out}/lib
cp *.a ${out}/lib/
{% endblock %}

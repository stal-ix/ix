{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libstemmer_c
{% endblock %}

{% block version %}
3.1.1
{% endblock %}

{% block fetch %}
https://snowballstem.org/dist/libstemmer_c-{{self.version().strip()}}.tar.gz
0e82fb0e29006cad2831b4b25980a1dae85959c6a1faaaf96547f551e352042a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block install %}
cp -R include ${out}/
mkdir ${out}/lib
cp *.a ${out}/lib/
{% endblock %}

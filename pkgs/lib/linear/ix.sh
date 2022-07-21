{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cjlin1/liblinear/archive/v244/liblinear-244.tar.gz
sha:6e2526245ba4d01bd2660f35f59293fe04e32d5b16fd0372e40d0609df63b373
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.h ${out}/include/
cp liblinear.so.* ${out}/lib/liblinear.a
{% endblock %}

{% block make_target %}
lib
{% endblock %}

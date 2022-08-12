{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cjlin1/liblinear/archive/v245/liblinear-245.tar.gz
sha:ce29f42c2c0d10e4627ac50a953fe3c130d2802868e6a2dc9a396356b96e8abc
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

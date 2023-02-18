{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cjlin1/liblinear/archive/v246/liblinear-246.tar.gz
sha:88bef33258c0b686a57a8f373ff3eb1912666aadd5a26cfb2101604ef2c64140
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

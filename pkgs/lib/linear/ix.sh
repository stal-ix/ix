{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/cjlin1/liblinear/archive/v247/liblinear-247.tar.gz
sha:a62c46f20a01a4626260462c905721f5471da4550d38c3b68ffacf0aa64067b4
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

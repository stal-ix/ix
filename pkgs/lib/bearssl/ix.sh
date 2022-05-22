{% extends '//die/make.sh' %}

{% block fetch %}
https://bearssl.org/bearssl-0.6.tar.gz
1513f9828c5b174ea409ca581cb45c98
{% endblock %}

{% block make_target %}
lib
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp build/libbearssl.a ${out}/lib
cp -R inc ${out}/include
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-bearssl=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

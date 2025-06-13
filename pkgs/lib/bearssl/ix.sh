{% extends '//die/c/make.sh' %}

{% block pkg_name %}
bearssl
{% endblock %}

{% block version %}
0.6
{% endblock %}

{% block fetch %}
https://bearssl.org/bearssl-{{self.version().strip()}}.tar.gz
sha:6705bba1714961b41a728dfc5debbe348d2966c117649392f8c8139efc83ff14
{% endblock %}

{% block make_target %}
lib
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp build/libbearssl.a ${out}/lib
cp -R inc ${out}/include
{% endblock %}

{% block env %}
export COFLAGS="--with-bearssl=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

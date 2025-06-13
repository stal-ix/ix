{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libb64
{% endblock %}

{% block version %}
1.2
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/libb64/libb64/libb64/libb64-{{self.version().strip()}}.src.zip
343d8d61c5cbe3d3407394f16a5390c06f8ff907bd8d614c16546310b689bfd3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp src/libb64.a ${out}/lib/
cp -R include ${out}/
{% endblock %}

{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/FlyGoat/RyzenAdj/archive/refs/tags/v0.14.0.tar.gz
sha:adb9f040b10fe0a7c1a4317b4c9b404f6db66631754300fc364003779312a0b1
{% endblock %}

{% block bld_libs %}
lib/c
lib/pci/utils
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/ryzenadj ${out}/bin/
{% endblock %}

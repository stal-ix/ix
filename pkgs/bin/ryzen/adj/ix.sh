{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
RyzenAdj
{% endblock %}

{% block version %}
0.17.0
{% endblock %}

{% block fetch %}
https://github.com/FlyGoat/RyzenAdj/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:848ac9d86ff65d30f5e2c8600aac2613f0f10003b0d6f0e516a54761d7345d44
{% endblock %}

{% block bld_libs %}
lib/c
lib/pci/utils
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/ryzenadj ${out}/bin/
{% endblock %}

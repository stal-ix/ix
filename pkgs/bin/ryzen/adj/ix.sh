{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
RyzenAdj
{% endblock %}

{% block version %}
0.19.0
{% endblock %}

{% block fetch %}
https://github.com/FlyGoat/RyzenAdj/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d1998b6c2d1b564f5d43c786cbf764ca9a1d8bb213e2001f98f611ead3087c7e
{% endblock %}

{% block bld_libs %}
lib/c
lib/pci/utils
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/ryzenadj ${out}/bin/
{% endblock %}

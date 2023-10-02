{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/FlyGoat/RyzenAdj/archive/refs/tags/v0.13.0.tar.gz
sha:083d929031521c40308d62a0167b6d8e5035699233be2452ae694ac85d66cdcf
{% endblock %}

{% block bld_libs %}
lib/c
lib/pciutils
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/obj/ryzenadj ${out}/bin/
{% endblock %}

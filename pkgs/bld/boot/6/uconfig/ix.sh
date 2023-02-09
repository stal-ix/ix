{% extends '//die/c/ix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/5/env/std
{% endblock %}

{% block fetch %}
https://github.com/skeeto/u-config/archive/refs/tags/v0.30.2.tar.gz
sha:adc6190211cabe96f7334036206ee4a43c5dd05ecbfeb2cc858f75497b888f4f
{% endblock %}

{% block build %}
cc -o pkg-config generic_main.c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp pkg-config ${out}/bin/
{% endblock %}

{% block env %}
export PKG_CONFIG=${out}/bin/pkg-config
{% endblock %}

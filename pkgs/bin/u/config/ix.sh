{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/skeeto/u-config/archive/refs/tags/v0.33.2.tar.gz
sha:58779127559e511e85a85f703c4ab82d65655908da060d1e3e5e1e6d49daf63f
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build %}
cc -o pkg-config generic_main.c
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp pkg-config ${out}/bin/
{% endblock %}

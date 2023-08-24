{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/skeeto/u-config/archive/refs/tags/v0.31.1.tar.gz
sha:ec66cf47f2912778618b40b83a6d43cdcb94dbd9b5ea6a5912a3b86267d3ad93
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

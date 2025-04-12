{% extends '//die/c/ix.sh' %}

{% block version %}
0.33.3
{% endblock %}

{% block fetch %}
https://github.com/skeeto/u-config/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:91fcec533a5987e44460d6499c30bdcb490ce89f8d31abd83e4fb6b16e510dc3
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

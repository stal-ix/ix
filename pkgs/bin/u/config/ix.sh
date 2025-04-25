{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
u-config
{% endblock %}

{% block version %}
0.34.0
{% endblock %}

{% block fetch %}
https://github.com/skeeto/u-config/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:68b98bb42635b7c16263aeb762e92d6e7049e4937a987d9b0c5c78935485992f
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block build %}
cc -o pkg-config main_posix.c
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp pkg-config ${out}/bin/
{% endblock %}

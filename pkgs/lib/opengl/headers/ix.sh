{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/NVIDIA/libglvnd/archive/refs/tags/v1.7.0.tar.gz
sha:073e7292788d4d3eeb45ea6c7bdcce9bfdb3b3eef8d7dbd47f2f30dce046ef98
{% endblock %}

{% block install %}
cp -R include ${out}/
rm \
    ${out}/include/*.h \
    ${out}/include/meson.build \
    ${out}/include/Makefile.am
rm -rf ${out}/include/glvnd
{% endblock %}

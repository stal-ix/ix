{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/NVIDIA/libglvnd/archive/refs/tags/v1.7.0.tar.gz
sha:073e7292788d4d3eeb45ea6c7bdcce9bfdb3b3eef8d7dbd47f2f30dce046ef98
https://gitlab.freedesktop.org/mesa/mesa/-/raw/06391759f0c705f24d0763a2e3691f55ce5f4f22/src/gbm/main/gbm.h
sha:95f3b4a6ee5175c7cc5d47368d4efb100063fe49e5a6f5b19030ac2ceed73b81
{% endblock %}

{% block step_unpack %}
mkdir src
cd src
extract 1 ${src}/v*
{% endblock %}

{% block install %}
cp -R include ${out}/
rm \
    ${out}/include/*.h \
    ${out}/include/meson.build \
    ${out}/include/Makefile.am
rm -rf ${out}/include/glvnd
cp ${src}/gbm.h ${out}/include/
{% endblock %}

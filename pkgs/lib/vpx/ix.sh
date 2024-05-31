{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/webmproject/libvpx/archive/refs/tags/v1.14.1.tar.gz
sha:901747254d80a7937c933d03bd7c5d41e8e6c883e0665fadcb172542167c7977
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/perl
bld/nasm
bld/elfutils
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out} \
    --disable-install-docs \
    --disable-install-srcs \
    --enable-postproc \
    --enable-runtime-cpu-detect \
    --enable-vp8 \
    --enable-vp9 \
    --enable-vp9-highbitdepth \
    --enable-vp9-temporal-denoising \
    --disable-dependency-tracking
{% endblock %}

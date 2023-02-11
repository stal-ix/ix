{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/webmproject/libvpx/archive/refs/tags/v1.13.0.tar.gz
sha:cb2a393c9c1fae7aba76b950bb0ad393ba105409fe1a147ccd61b0aaa1501066
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/perl
bin/nasm
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
    --enable-vp9-temporal-denoising
{% endblock %}

{% extends '//die/make.sh' %}

{% block fetch %}
https://chromium.googlesource.com/webm/libvpx/+archive/03265cd42b3783532de72f2ded5436652e6f5ce3.tar.gz
sem:92ec7e71b949d65ebe9436a29ce763f3
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/perl
bin/nasm
bin/elfutils
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

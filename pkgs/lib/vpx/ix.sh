{% extends '//die/c/make.sh' %}

{% block fetch %}
https://chromium.googlesource.com/webm/libvpx/+archive/03265cd42b3783532de72f2ded5436652e6f5ce3.tar.gz
sem:5cb5e79c7ff32eda78123ed8132005ee25c7b5a00d276d86b220d07050010547
{% endblock %}

{% block skip_dirs %}0{% endblock %}

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

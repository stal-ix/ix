{% extends '//die/make.sh' %}

{% block fetch %}
https://chromium.googlesource.com/webm/libvpx/+archive/626ff35955c2c35b806b3e0ecf551a1a8611cdbf.tar.gz
sem:05ff83b352b7247177f762a307914685
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

{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/webmproject/libvpx/archive/refs/tags/v1.14.0.tar.gz
sha:5f21d2db27071c8a46f1725928a10227ae45c5cd1cad3727e4aafbe476e321fa
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

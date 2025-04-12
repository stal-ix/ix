{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libvpx
{% endblock %}

{% block version %}
1.15.0
{% endblock %}

{% block fetch %}
https://github.com/webmproject/libvpx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e935eded7d81631a538bfae703fd1e293aad1c7fd3407ba00440c95105d2011e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/perl
bld/nasm
bld/fake/binutils
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

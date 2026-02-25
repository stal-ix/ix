{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libvpx
{% endblock %}

{% block version %}
1.16.0
{% endblock %}

{% block fetch %}
https://github.com/webmproject/libvpx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7a479a3c66b9f5d5542a4c6a1b7d3768a983b1e5c14c60a9396edc9b649e015c
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

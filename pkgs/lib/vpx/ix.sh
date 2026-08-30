{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libvpx
{% endblock %}

{% block version %}
1.17.0
{% endblock %}

{% block fetch %}
https://github.com/webmproject/libvpx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1020f184046187baa2985dbde38e0691f49c44088bca7a1842b0236c6081dc0a
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

{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libvpx
{% endblock %}

{% block version %}
1.15.2
{% endblock %}

{% block fetch %}
https://github.com/webmproject/libvpx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
26fcd3db88045dee380e581862a6ef106f49b74b6396ee95c2993a260b4636aa
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

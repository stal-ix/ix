{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libvpx
{% endblock %}

{% block version %}
1.15.1
{% endblock %}

{% block fetch %}
https://github.com/webmproject/libvpx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:6cba661b22a552bad729bd2b52df5f0d57d14b9789219d46d38f73c821d3a990
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

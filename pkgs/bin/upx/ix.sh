{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v3.96/upx-3.96-src.tar.xz
md5:bf5564f33fe9062bc48b53abd4b34223
{% endblock %}

{% block bld_libs  %}
lib/z
lib/c
lib/c++
lib/ucl/codec
{% endblock %}

{% block bld_tool %}
bld/bash
bld/perl
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block make_flags %}
CHECK_WHITESPACE=true
UPX_LZMA_VERSION=0x465
UPX_LZMADIR=${PWD}
CXXFLAGS_WERROR=
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp upx.out ${out}/bin/upx
{% endblock %}

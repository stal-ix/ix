{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v3.96/upx-3.96-src.tar.xz
bf5564f33fe9062bc48b53abd4b34223
{% endblock %}

{% block bld_libs  %}
lib/z
lib/c
lib/c++
lib/ucl
{% endblock %}

{% block bld_tool %}
bld/bash
bld/perl
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block unpack %}
{{super()}}
cd src
{% endblock %}

{% block install %}
mkdir ${out}/bin; cp upx.out ${out}/bin/upx
{% endblock %}

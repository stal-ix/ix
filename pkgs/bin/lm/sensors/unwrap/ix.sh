{% extends '//die/c/make.sh'  %}

{% block fetch %}
https://github.com/lm-sensors/lm-sensors/archive/refs/tags/V3-6-0.tar.gz
sha:0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_flags %}
CC=clang
SBINDIR=${out}/bin
{% endblock %}

{% block install %}
{{super()}}
for x in fancontrol pwmconfig; do
    sed -e 's|#!/bin/bash|#!/usr/bin/env bash|' -i ${out}/bin/${x}
done
{% endblock %}

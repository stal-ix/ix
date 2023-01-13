{% extends '//die/c/kconfig.sh' %}

{% block fetch %}
https://github.com/landley/toybox/archive/refs/tags/0.8.9.tar.gz
sha:8f2782073c1c862a405315b6516d8410e47139fc2c94b98bb5d23804537c1b65
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}

{% block setup %}
export NOSTRIP=yes
{% endblock %}

{% block make_flags %}
PREFIX=${out}/bin
{% endblock %}

{% block make_install_target %}
install_flat
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|#!/bin/bash|#!/usr/bin/env bash|' -i ${l}
done
{{super()}}
{% endblock %}

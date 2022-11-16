{% extends '//die/c/kconfig.sh' %}

{% block fetch %}
https://github.com/landley/toybox/archive/refs/tags/0.8.8.tar.gz
sha:2bed6bb9edd5a249023103cf0402a835b0e53d10304a263f6f1e77a8aa49a898
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

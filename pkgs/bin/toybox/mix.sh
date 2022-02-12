{% extends '//mix/kconfig.sh' %}

{% block fetch %}
https://github.com/landley/toybox/archive/refs/tags/0.8.6.tar.gz
sha:e2c4f72a158581a12f4303d0d1aeec196b01f293e495e535bcdaf75eb9ae0987
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
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

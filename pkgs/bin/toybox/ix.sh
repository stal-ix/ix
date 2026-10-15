{% extends '//die/c/kconfig.sh' %}

{% block pkg_name %}
toybox
{% endblock %}

{% block version %}
0.8.15
{% endblock %}

{% block fetch %}
https://github.com/landley/toybox/archive/refs/tags/{{self.version().strip()}}.tar.gz
52452b68a6cf50f9a9728b0f844b03c4dd1f70463675b202e6cf0475bda3934f
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/bash
bin/gzip
{% endblock %}

{% block setup_target_flags %}
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

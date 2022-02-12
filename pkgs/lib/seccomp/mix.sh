{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/seccomp/libseccomp/archive/refs/tags/v2.5.2.tar.gz
7803456cfac52313e109dae6b57264ec
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bin/gperf
bld/bash
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|#!/bin/bash|#!/usr/bin/env bash|' -i ${l}
done
{% endblock %}

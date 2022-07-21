{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/seccomp/libseccomp/archive/refs/tags/v2.5.4.tar.gz
sha:96bbadb4384716272a6d2be82801dc564f7aab345febfe9b698b70fc606e3f75
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

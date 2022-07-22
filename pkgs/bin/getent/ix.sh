{% extends '//die/std/ix.sh' %}

{% block fetch %}
{% include '//lib/uclibc/ng/ver.sh' %}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp extra/scripts/getent ${out}/bin/
sed -e 's|#!/bin/sh|#!/usr/bin/env sh|' -i ${out}/bin/getent
{% endblock %}

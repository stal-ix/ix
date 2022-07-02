{% extends '//bin/libtool/t/ix.sh' %}

{% block bld_libs %}
lib/c
{{super()}}
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

find . -type f | while read l; do
    sed -e 's|#!.*/bin/sh|#!/usr/bin/env sh|' \
        -e 's|/.*/store/.*/bin/||g' \
        -i ${l}
done

cd bin

ln -s libtoolize glibtoolize
ln -s libtool glibtool
{% endblock %}

{% block env %}
export LIBTOOLIZE=libtoolize
{% endblock %}

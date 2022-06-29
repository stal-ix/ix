{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz
sha:e3bd4d5d3d025a36c21dd6af7ea818a2afcd4dfc1ea5a17b39d7854bcd0c06e3
{% endblock %}

{% block bld_tool %}
bld/m4
{% endblock %}

{% block build_flags %}
shut_up
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

{% block bld_libs %}
lib/c
{% endblock %}

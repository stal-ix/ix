{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot/libtracefs-1.7.0.tar.gz
sha:411fcbf3434ecbaefa6c2b1bf092266293a672e2d7ee46fdd6b402753cb8bd16
{% endblock %}

{% block lib_deps %}
lib/c
lib/trace/event
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bash
bld/bison
bld/fake(tool_name=xmlto)
bld/fake(tool_name=asciidoc)
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|/bin/bash|/usr/bin/env bash|' -i ${l}
done
{% endblock %}

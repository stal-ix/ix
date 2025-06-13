{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libtracefs
{% endblock %}

{% block version %}
1.8.2
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot/libtracefs-{{self.version().strip()}}.tar.gz
255980e1da5648fbbc32777ed8457b485b2b96f3449674610b46d9c437271209
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

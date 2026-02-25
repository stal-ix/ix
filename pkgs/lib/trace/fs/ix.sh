{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libtracefs
{% endblock %}

{% block version %}
1.8.3
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot/libtracefs-{{self.version().strip()}}.tar.gz
a9cd9cbae81b7fff71b3f72d2b819e49cec0402529e5f252e1d9319a62a356cb
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

{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libtracefs
{% endblock %}

{% block version %}
1.8.4
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot/libtracefs-{{self.version().strip()}}.tar.gz
75187bad93e622c94c4a691173e45f08948d38b9a28e9b855b54a3e956d289a6
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

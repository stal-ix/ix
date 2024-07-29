{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot/libtracefs-1.8.1.tar.gz
sha:d295aa20d711c313a9e229dbd15ba14026f0c1a50d57ae8b0823cc561b23745f
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

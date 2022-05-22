{% extends '//bin/binutils/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd gold
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/bfd
lib/iberty
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|../bfd/bfdver.h|bfdver.h|g' -i ${l}
done
{% endblock %}

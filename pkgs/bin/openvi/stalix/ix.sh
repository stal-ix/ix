{% extends '//bin/openvi/stock/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/shim/ix
{% endblock %}

{% block cpp_missing %}
{{super()}}
ix.h
{% endblock %}

{% block patch %}
{{super()}}
find . -type f | while read l; do
    sed -e 's|tname\[\] = .*|\*tname = ix_mkstemp_template();|g' -i ${l}
done
{% endblock %}

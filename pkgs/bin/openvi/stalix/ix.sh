{% extends '//bin/openvi/stock/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/shim/ix
{% endblock %}

{% block setup %}
{{super()}}
export CPPFLAGS="-include ix.h ${CPPFLAGS}"
{% endblock %}

{% block patch %}
{{super()}}
find . -type f | while read l; do
    sed -e 's|tname\[\] = .*|\*tname = ix_mkstemp_template();|g' -i ${l}
done
{% endblock %}

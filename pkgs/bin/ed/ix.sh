{% extends 'stock/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/shim/ix
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|tmpfile()|fdopen(ix_mkstemp(), "w+b")|' -i buffer.c
{% endblock %}

{% block cpp_missing %}
{{super()}}
ix.h
{% endblock %}

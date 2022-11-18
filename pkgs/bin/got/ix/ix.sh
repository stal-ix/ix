{% extends '//bin/got/stock/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/shim/ix
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|mkstemp(name.*|ix_mkstemp();|' -i lib/opentemp.c
{% endblock %}

{% block cpp_missing %}
{{super()}}
ix.h
{% endblock %}

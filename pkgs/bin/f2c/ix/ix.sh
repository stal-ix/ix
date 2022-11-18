{% extends '//bin/f2c/stock/ix.sh' %}

{% block bld_libs %}
lib/shim/ix
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*str.*tmp.*f2c.*|tdbuf = ix_mkstemp_template();|' \
    -e 's|static.*tdbuf.*|char* tdbuf = malloc(1024);|' \
    -i sysdep.c
{% endblock %}

{% block cpp_missing %}
{{super()}}
ix.h
{% endblock %}

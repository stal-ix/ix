{% extends '//bin/wl/clipboard/stock/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/shim/ix
{% endblock %}

{% block cpp_missing %}
{{super()}}
ix.h
{% endblock %}

{% block patch %}
sed -e 's|char.*tmp.*|char* dirpath = ix_mkstemp_template();|' \
    -e 's|sizeof(dirpath)|(strlen(dirpath) + 1)|g' \
    -i src/util/files.c
{% endblock %}

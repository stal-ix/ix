{% extends '//lib/dwarf/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/z
lib/zstd
{% endblock %}

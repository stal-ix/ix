{% extends '//lib/brotli/t/mix.sh' %}

{% block bld_libs %}
lib/z
lib/xz
lib/lz4
{{super()}}
{% endblock %}

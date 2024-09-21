{% extends '//lib/raw/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/z
lib/omp
lib/jpeg
{% endblock %}

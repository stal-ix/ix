{% extends '//lib/musl/t/ix.sh' %}

{% block env %}
{{super()}}
export ac_cv_func_malloc_0_nonnull=yes
{% endblock %}

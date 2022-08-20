{% extends 'lite/ix.sh' %}

{% block bld_libs %}
lib/gmp
lib/mpfr
{{super()}}
{% endblock %}

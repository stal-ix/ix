{% extends 'std/mix.sh' %}

{% block std_env %}
alt/c/mix.sh
{{super()}}
{% endblock %}

{% block setup_compiler %}
setup_toolchain
{% endblock %}

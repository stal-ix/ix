{% extends 'template.sh' %}

{% block bld_deps %}
{% block std_env %}
{% block std_box %}
env/std/mix.sh
{% endblock %}
{% endblock %}
{{super()}}
{% endblock %}

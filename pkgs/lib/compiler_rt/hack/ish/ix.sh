{% extends '//lib/compiler_rt/hack/ix.sh' %}

{% block patch %}
rm lib/builtins/gcc_personality_v0.c
{{super()}}
{% endblock %}

{% extends '//lib/compiler_rt/builtins/hack/ix.sh' %}

{% block patch %}
rm lib/builtins/gcc_personality_v0.c
{{super()}}
{% endblock %}

{% extends '//boot/7/lib/compiler_rt/mix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/3/env/mix.sh
{% endblock %}

{% block patch %}
{{super()}}
rm lib/builtins/gcc_personality_v0*
{% endblock %}

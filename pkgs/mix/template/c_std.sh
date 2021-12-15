{% extends 'std/mix.sh' %}

{% block std_env %}
{% block c_compiler %}
dev/lang/clang/mix.sh
{% endblock %}
{{super()}}
{% endblock %}

{% block setup_compiler %}
setup_toolchain
{% endblock %}

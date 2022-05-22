{% extends '//bld/boot/7/lib/compiler_rt/ix.sh' %}

{% block lib_deps %}
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/3/env
{% endblock %}

{% block patch %}
{{super()}}
rm lib/builtins/gcc_personality_v0*
{% endblock %}

{% extends '//bin/ya/t/ix.sh' %}

{% block bld_tool %}
bin/ay
{{super()}}
{% endblock %}

{% block run_deps %}
bin/ya/tools/wrapper
{% endblock %}

{% block ya_bootstrap %}yes{% endblock %}
{% block ya_builder %}ay{% endblock %}

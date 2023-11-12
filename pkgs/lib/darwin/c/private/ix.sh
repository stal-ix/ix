{% extends '//lib/darwin/c/t/ix.sh' %}

{% block fetch %}
{{sdk_url or error()}}
{{sdk_sha or error()}}
{% endblock %}

{% block env %}
export MACOSX_DEPLOYMENT_TARGET={{sdk_target or error()}}
{{super()}}
{% endblock %}

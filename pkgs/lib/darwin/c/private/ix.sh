{% extends '//lib/darwin/c/t/ix.sh' %}

{% block fetch %}
{{sdk_url | defined('sdk_url')}}
{{sdk_sha | defined('sdk_sha')}}
{% endblock %}

{% block env %}
export MACOSX_DEPLOYMENT_TARGET={{sdk_target | defined('sdk_target')}}
{{super()}}
{% endblock %}

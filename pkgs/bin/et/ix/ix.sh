{% extends '//bin/et/stock/ix.sh' %}

{% block cmake_flags %}
{{super()}}
DISABLE_SENTRY=ON
DISABLE_TELEMETRY=ON
DISABLE_CRASH_LOG=ON
{% endblock %}

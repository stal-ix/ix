{% extends '//die/hub.sh' %}

{% block run_deps %}
{# UTC-only date in uclibc/ng #}
bin/busybox/ix
{% endblock %}

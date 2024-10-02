{% extends '//die/hub.sh' %}

{% block run_deps %}
{# UTC-only date in uclibc/ng #}
bin/subreaper
bin/busybox/ix
bin/busybox/scripts
{% endblock %}

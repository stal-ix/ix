{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/runsrv
bin/acpi/d/d
bin/acpi/d/runit/scripts
{% endblock %}

{% block run_data %}
bin/acpi/d/rules
{% endblock %}

{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/acpi/d/d
etc/services/runit(srv_deps=bin/acpi/d/d,srv_dir=acpid2,srv_command=exec acpid -c /etc/acpi -d -f -l -m 0777 -p pid -l lockf)
{% endblock %}

{% block run_data %}
bin/acpi/d/rules
{% endblock %}

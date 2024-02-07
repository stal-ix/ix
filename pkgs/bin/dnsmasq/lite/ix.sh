{% extends '//bin/dnsmasq/t/ix.sh' %}

{% block setup_target_flags %}
{{super()}}
export COPTS="-DNO_TFTP -DNO_DHCP -DNO_DHCP6 -DNO_SCRIPT ${COPTS}"
{% endblock %}

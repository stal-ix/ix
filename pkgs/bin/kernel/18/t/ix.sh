{% extends '//bin/kernel/t/1/ix.sh' %}

{% block kernel_name %}
{% block kernel_version %}5-18-14{% endblock %}-slot{{self.slot()}}
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block host_libs %}
{{super()}}
{% block kernel_headers %}
bin/kernel/18/headers
{% endblock %}
{% endblock %}

{% block kconfig_flags %}
{% block kernel_flags %}
{% endblock %}
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
# disable mitigations by default
sed -e 's|\tCPU_MITIGATIONS_AUTO;|\tCPU_MITIGATIONS_OFF;|' -i kernel/cpu.c
{% endblock %}

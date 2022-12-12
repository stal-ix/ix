{% extends '//bin/kernel/t/1/ix.sh' %}

{% block kernel_name %}
{{self.kernel_version()}}-slot{{self.slot()}}
{% endblock %}

{% block host_libs %}
{{super()}}
{{self.kernel_headers()}}
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

{% block bld_tool %}
bld/bash
{{super()}}
{% endblock %}

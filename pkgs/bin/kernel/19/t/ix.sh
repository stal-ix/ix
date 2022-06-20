{% extends '//bin/kernel/t/1/ix.sh' %}

{% block kernel_name %}
5-19-rc3-slot{{self.slot()}}
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block host_libs %}
{{super()}}
bin/kernel/19/headers
{% endblock %}

{% block bld_tool %}
bld/bash
{{super()}}
{% endblock %}

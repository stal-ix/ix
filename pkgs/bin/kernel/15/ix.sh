{% extends '//bin/kernel/t/1/ix.sh' %}

{% block kernel_name %}
5.15.24
{% endblock %}

{% block bld_tool %}
bld/bash
{{super()}}
{% endblock %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block host_libs %}
{{super()}}
bin/kernel/15/headers
{% endblock %}

{% block kconfig_flags %}
{% include 'cfg' %}
{{super()}}
{% endblock %}

{% block patch %}
B=$(which bash)

find . -type f | while read l; do
    sed -e "s|/bin/bash|${B}|" -i ${l}
done

{{super()}}
{% endblock %}

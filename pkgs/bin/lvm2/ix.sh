{% extends '//lib/device/mapper/ix.sh' %}

{% block bld_libs %}
lib/readline
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
# always static
rm -rf ${out}/sbin
{% endblock %}

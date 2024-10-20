{% extends '//bin/kernel/t/4/ix.sh' %}

{% include 'ver.sh' %}

{% block kernel_flags %}
{% include '//bin/kernel/configs/cfg_6_11' %}
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/pahole
{% endblock %}

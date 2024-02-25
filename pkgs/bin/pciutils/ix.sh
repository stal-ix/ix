{% extends '//lib/pci/utils/t/ix.sh' %}

{% block bld_libs %}
lib/z
lib/kmod
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{{super()}}
{% endblock %}

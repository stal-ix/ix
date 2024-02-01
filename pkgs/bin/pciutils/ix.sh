{% extends '//lib/pci/utils/ix.sh' %}

{% block bld_libs %}
lib/z
lib/kmod
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{{super()}}
{% endblock %}

{% block make_install_target %}
install
{% endblock %}

{% extends '//lib/pciutils/ix.sh' %}

{% block bld_libs %}
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

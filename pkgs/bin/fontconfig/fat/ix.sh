{% extends '//bin/fontconfig/ix.sh' %}

{% block bld_tool %}
bld/wrap/cc/plugins/norm
bld/wrap/cc/plugins/logcmd
{{super()}}
{% endblock %}

{% block build_flags %}
wrap_cc
{{super()}}
{% endblock %}

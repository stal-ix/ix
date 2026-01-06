{% extends '//lib/fontconfig/t/t/ix.sh' %}

{% block bld_libs %}
lib/intl
lib/freetype
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/wrap/cc/plugins/logcmd
{{super()}}
{% endblock %}

{% block build_flags %}
wrap_cc
{{super()}}
{% endblock %}

{% extends 'make.sh' %}

{% block std_box %}
{% block premake_tool %}
bld/premake
{% endblock %}
{{super()}}
{% endblock %}

{% set premake_flags %}
{% block premake_flags %}
{% endblock %}
{% endset %}

{% block configure %}
{% if help %}
premake5 --help
exit 1
{% endif %}
premake5 {{ix.fix_list(premake_flags)}} gmake2
{% endblock %}

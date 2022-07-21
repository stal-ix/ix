{% extends 'make.sh' %}

{% block std_box %}
bld/pkg/config
{{super()}}
{% endblock %}

{% block configure %}
{% block check_tools %}
{% if not boot %}
which pkg-config
{% endif %}
{% endblock %}

{% block invoke_configure %}
{% set command_args %}
{% block configure_shell %}
sh
{% endblock %}

{% block configure_script %}
configure
{% endblock %}

{% block configure_all_flags %}
--prefix="${out}"
--sbindir="${out}/bin"
--libexecdir="${out}/{{kind}}/{{uniq_id}}"
{% block configure_flags %}
{% endblock %}
{% endblock %}

{% if help %}
--help
{% endif %}
{% endset %}

{{ix.fix_list(command_args)}}
{% endblock %}
{% if help %}
exit 1
{% endif %}
{% endblock %}

{% extends 'c_std.sh' %}

{% block std_box %}
{% block make_tool %}
bld/make
{% endblock %}
{{super()}}
{% endblock %}

{% set make_cmd_args %}
{% block make_bin %}
make
{% endblock %}

{% if not verbose %}
-s
{% endif %}

SHELL="$(which sh)"
PREFIX="${out}"
prefix="${out}"

{% if verbose %}
V=1
{% else %}
{% block make_verbose_1 %}
V=0
{% endblock %}
{% endif %}

{% block make_flags %}
{% endblock %}
{% endset %}

{% block build %}
{% set make_target %}
{% block make_target %}
{% endblock %}
{% endset %}

{% set cmd_args1 %}
{{make_cmd_args}}
{% block make_no_thrs %}
-j ${make_thrs}
{% endblock %}
{{make_target}}
{% endset %}

{% set cmd_args2 %}
{{make_cmd_args}}
{{make_target}}
{% endset %}

{{mix.fix_list(cmd_args1)}} || {{mix.fix_list(cmd_args2)}}
{% endblock %}

{% block install %}
{% set cmd_args %}
{{make_cmd_args}}
{% block make_install_target %}
install
{% endblock %}
{% endset %}

{{mix.fix_list(cmd_args)}}
{% endblock %}

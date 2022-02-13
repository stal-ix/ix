{% extends '//mix/autohell.sh' %}

{% block c_rename_symbol %}
sh_set_lines_and_columns
sh_unset_nodelay_mode
sh_get_env_value
sh_get_env_value
sh_get_home_dir
sh_single_quote
is_basic_table
xfree
{% endblock %}

{% block configure_flags %}
--without-bash-malloc
--enable-extended-glob
--enable-job-control
--enable-prompt-string-decoding
{% if linux %}
--enable-static-link
{% endif %}
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{{super()}}
{% endblock %}

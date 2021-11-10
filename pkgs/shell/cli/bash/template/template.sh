{% extends '//mix/template/autohell.sh' %}

{% block setup %}
export CPPFLAGS="-Dsh_unset_nodelay_mode=bash_sh_unset_nodelay_mode -Dsh_get_env_value=bash_sh_get_env_value -Dsh_get_env_value=bash_sh_get_env_value -Dsh_get_home_dir=bash_sh_get_home_dir -Dsh_set_lines_and_columns=bash_sh_set_lines_and_columns -Dxfree=bash_xfree -Dsh_single_quote=bash_sh_single_quote -Dis_basic_table=bash_is_basic_table ${CPPFLAGS}"
{% endblock %}

{% block bld_deps %}
{{super()}}
boot/final/env/bison/mix.sh
{% block bashdeps %}
{% endblock %}
{% endblock %}

{% block coflags %}
--without-bash-malloc
--enable-extended-glob
--enable-job-control
--enable-prompt-string-decoding
{% if mix.platform.target.os == 'linux' %}
--enable-static-link
{% endif %}
{% block bashflags %}{% endblock %}
{% endblock %}

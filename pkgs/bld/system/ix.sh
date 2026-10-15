{% extends '//die/env.sh' %}

{% block env %}
export PATH="{{system_path or '/usr/local/bin:/usr/bin:/bin'}}:${PATH}"
# system tools, not system libraries: the host's .pc files must stay out of
# sight, a configure would otherwise pick a host library it cannot link
export PKG_CONFIG_LIBDIR=""
{% if system_aclocal_path %}
export ACLOCAL_PATH="{{system_aclocal_path}}:${ACLOCAL_PATH}"
{% endif %}
{% endblock %}

{% block script_body %}
{{super()}}
mkdir -p ${out}/bin
ln -s "$(command -v bash)" ${out}/bin/sh
{% endblock %}

{% block script_exec %}
["/usr/bin/env", "PATH={{system_path or '/usr/local/bin:/usr/bin:/bin'}}", "env", "bash", "-s"]
{% endblock %}

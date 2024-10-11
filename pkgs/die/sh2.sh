{% extends 'sh1.sh' %}

{% block script_prologue %}
{{super()}}
set -eu
{% if setx or verbose %}
set -x
{% endif %}
cd /
{% endblock %}

{% block script_init_env %}
{{super()}}
export PATH=
export COFLAGS=
export CMFLAGS=
export GIRPATH=
export VALAFLAGS=
export GIRSFLAGS=
export GIRCFLAGS=
export PYTHONPATH=
export ACLOCAL_PATH=
export PKG_CONFIG_PATH=
export CMAKE_PREFIX_PATH=
export PYTHONDONTWRITEBYTECODE=1
export TMPDIR=${tmp}/tmp
export HOME=${TMPDIR}
{% endblock %}

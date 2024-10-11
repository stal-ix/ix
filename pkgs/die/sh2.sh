{% extends 'sh1.sh' %}

{% block script_functions %}
source_env() {
    OFS=${IFS}; IFS=':'; for x in ${1}; do
        IFS=${OFS}; . "${x}/env"; IFS=':'
    done; IFS=${OFS}
}

fast_rm() (
    mv "${2}" "{{trash_dir}}/${IX_RANDOM}_${1}" || true
)
{% endblock %}

{% block script_prologue %}
set -eu
{% if setx or verbose %}
set -x
{% endif %}
cd /
{% endblock %}

{% block script_init_env %}
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

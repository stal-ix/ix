{% extends 'script.json' %}

{% block script_body %}
# {{rebuild}}
{% block prologue %}
set -eu

{% if setx %}
set -x
{% endif %}

cd /

source_env() {
    OFS=${IFS}; IFS=':'; for x in ${1}; do
        IFS=${OFS}; . "${x}/env"; IFS=':'
    done; IFS=${OFS}
}

fast_rm() (
    mv ${1} /mix/trash/ || rm -rf ${1}
)

{% block functions %}
{% endblock %}

# init
{% block script_init_env %}
export PATH=
export COFLAGS=
export CMFLAGS=
export PYTHONPATH=
export LOCALE_PATH=
export ACLOCAL_PATH=
export PKG_CONFIG_PATH=
export PYTHONDONTWRITEBYTECODE=1
{% endblock %}

source_env "${MIX_B_DIR}"

# lib only
export COFLAGS=
export CMFLAGS=
export LOCALE_PATH=

fast_rm ${out}
mkdir -p ${out}

fast_rm ${tmp}
mkdir -p ${tmp}

cd ${tmp}
mkdir tmp

export TMPDIR=${PWD}/tmp
{% endblock %}

(
# suc
{% block sh_script %}
{% endblock %}
# euc
)

{% block epilogue %}
{% block chmod_ro %}
if command -v find; then
    find ${out} | sort -r | while read l; do
        chmod a-w "${l}" || rm "${l}"
    done

    chmod +w ${out}
fi
{% endblock %}

fast_rm ${tmp}
{% endblock %}
{% endblock %}

{% block script_kind %}
sh
{% endblock %}

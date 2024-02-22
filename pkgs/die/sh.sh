{% extends 'script.json' %}

{% block script_body %}
# {{rebuild}}
{% block prologue %}
set -eu

{% if setx or verbose %}
set -x
{% endif %}

cd /

source_env() {
    OFS=${IFS}; IFS=':'; for x in ${1}; do
        IFS=${OFS}; . "${x}/env"; IFS=':'
    done; IFS=${OFS}
}

fast_rm() (
    mv "${2}" "{{trash_dir}}/${IX_RANDOM}_${1}" || true
)

{% block functions %}
{% endblock %}

# init
{% block script_init_env %}
export PATH=
export COFLAGS=
export CMFLAGS=
export PYTHONPATH=
export ACLOCAL_PATH=
export PKG_CONFIG_PATH=
export CMAKE_PREFIX_PATH=
export PYTHONDONTWRITEBYTECODE=1
{% endblock %}

source_env "${IX_B_DIR}"

fast_rm 1 ${out}
mkdir -p ${out}

fast_rm 2 ${tmp}
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
) < /dev/null

{# https://gist.github.com/pg83/4e54f757ce838ba6aaf746b6b9a2b8b3 #}

{% block epilogue %}
{% block fix_mtime  %}
if command -v find; then
    find ${out} -type f | while read l; do
        touch -t 200001010000.00 "${l}"
    done
fi
{% endblock %}

{% block chmod_ro %}
if command -v find; then
    find ${out} | sort -r | while read l; do
        chmod a-w "${l}" || rm "${l}"
    done

    chmod +w ${out}
fi
{% endblock %}

{% if simulate_failure %}
exit 1
{% endif %}
{% if not skipsrc %}
fast_rm 3 ${tmp}
{% endif %}
{% endblock %}
{% endblock %}

{% block script_exec %}
sh -s
{% endblock %}

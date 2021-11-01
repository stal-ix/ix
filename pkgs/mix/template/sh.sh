{% block deps %}
{% set bld_deps %}
{% block bld_deps %}
{% endblock %}
{% endset %}

{% set lib_deps %}
{% block lib_deps %}
{% endblock %}
{% endset %}

{% set run_deps %}
{% block run_deps %}
{% endblock %}
{% endset %}

# bld {{bld_deps.replace('\n', ' ')}}
# lib {{lib_deps.replace('\n', ' ')}}
# run {{run_deps.replace('\n', ' ')}}
{% endblock %}

{% block more_deps %}
{% endblock %}

{% block fetch %}
{% endblock %}

{% block sh_script_begin %}
{% endblock %}

set -e
set -u

# init
export CMPATH=
export COFLAGS=
export CMFLAGS=
export CFLAGS=
export CXXFLAGS=
export CPPFLAGS=
export LDFLAGS=
export CONLYFLAGS=
export PKG_CONFIG_PATH=
export PYTHONPATH=
export ACLOCAL_PATH=
export PYTHONDONTWRITEBYTECODE=1

rm -rf ${out} || true
mkdir -p ${out}

rm -rf ${tmp} || true
mkdir -p ${tmp}

cd ${tmp} && mkdir tmp

export TMPDIR=${PWD}/tmp

line=
OFS=${IFS}

IFS=":"; for i in ${PATH}; do
    line="${i}:${line}"
done

IFS=":"; for p in ${line}; do
    env=${p%/bin}/env

    if test -f ${env}; then
        . ${env}
    fi
done

IFS=${OFS}

# suc
{% block sh_script %}
{% endblock %}
# euc

rm -rf ${out}/lib/*.so* ${out}/lib/*.la* ${out}/lib/*.dylib* || true
rm -rf ${tmp}

{% block sh_script_end %}
{% endblock %}

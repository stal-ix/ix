{% extends 'script.json' %}

{% block script_body %}
{% block sh_script_begin %}
{% endblock %}

set -e
set -u

# init
export CMPATH=
export CFLAGS=
export COFLAGS=
export CMFLAGS=
export LDFLAGS=
export CXXFLAGS=
export CPPFLAGS=
export CONLYFLAGS=
export PYTHONPATH=
export ACLOCAL_PATH=
export PKG_CONFIG_PATH=
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

(
    set -eu
# suc
{% block sh_script %}
{% endblock %}
# euc
)

{% block cleanup_pkg %}rm -rf ${out}/lib/*.so* ${out}/lib/*.la* ${out}/lib/*.dylib* || true{% endblock %}
rm -rf ${tmp}

{% block sh_script_end %}
{% endblock %}
{% endblock %}

{% block script_kind %}
sh
{% endblock %}

{% extends 'script.json' %}

{% block script_body %}
{% block prologue %}
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

rm -rf ${out}
mkdir -p ${out}

rm -rf ${tmp}
mkdir -p ${tmp}

cd ${tmp} && mkdir tmp

export TMPDIR=${PWD}/tmp

OFS=${IFS}

IFS=":"; for p in ${MIX_ENVPATH}; do
    . ${p}
done

IFS=${OFS}
{% endblock %}

(
    set -eu

# suc
{% block sh_script %}
{% endblock %}
# euc
)

{% block epilogue %}
{% block cleanup_pkg %}
rm -rf ${out}/lib/*.so* ${out}/lib/*.la* ${out}/lib/*.dylib* || true
{% endblock %}
rm -rf ${tmp}
{% endblock %}
{% endblock %}

{% block script_kind %}
sh
{% endblock %}

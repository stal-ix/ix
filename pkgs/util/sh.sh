{% block deps %}
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
export COFLAGS=
export CMFLAGS=
export CFLAGS=
export MAKE_FLAGS=
export CXXFLAGS=
export CPPFLAGS=
export LDFLAGS=
export CONLYFLAGS=
export PKG_CONFIG_PATH=
export PYTHONPATH=
export PYTHONDONTWRITEBYTECODE=1

export TMPDIR=${tmp}/tmp

rm -rf ${out} || true
mkdir -p ${out}

{% block fetch_cached_pkg %}
cd ${out}

if ${exe} ${mix} misc fetch https://storage.yandexcloud.net/mix-cache/cache/pkg/${uid}; then
    ${exe} ${mix} misc untar ${uid}

    exit 0
fi
{% endblock %}

rm -rf ${tmp} || true
mkdir -p ${tmp}

cd ${tmp} && mkdir tmp

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

set -x

# suc
{% block sh_script %}
{% endblock %}
# euc

set +x

rm -rf ${out}/lib/*.so* ${out}/lib/*.la* ${out}/lib/*.dylib* || true

{% block cache_pkg %}
${exe} ${mix} misc tar ${out} ${tmp}/${uid}
${exe} ${mix} cache upload ${tmp}/${uid} pkg/${uid}
{% endblock %}

rm -rf ${tmp}

{% block sh_script_end %}
{% endblock %}

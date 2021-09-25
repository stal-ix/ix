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

rm -rf ${out} || true
mkdir -p ${out}

rm -rf ${tmp} || true
mkdir -p ${tmp}

cd ${tmp} && mkdir tmp

export TMPDIR=${PWD}/tmp

{% block fetch_cached_pkg %}
if ${exe} ${mix} misc fetch https://storage.yandexcloud.net/mix-cache/cache/pkg/${uid}; then
    cd ${out} && ${exe} ${mix} misc untar ${tmp}/${uid}

    exit 0
fi
{% endblock %}

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

{% block cache_pkg %}
${exe} ${mix} misc tar ${out} ${tmp}/${uid}
${exe} ${mix} cache upload ${tmp}/${uid} pkg/${uid}
{% endblock %}

rm -rf ${tmp}

{% block sh_script_end %}
{% endblock %}

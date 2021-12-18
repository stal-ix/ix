{%   if kind == 'dat' %}
rm -rf ${out}/bin ${out}/libexec ${out}/lib ${out}/include
{% elif kind == 'lib' %}
if test -f ${out}/bin/*-config; then
    mkdir -p ${out}/lib/bin && mv ${out}/bin/*-config ${out}/lib/bin/
fi

rm -rf ${out}/bin ${out}/libexec
{% elif kind == 'bin' %}
rm -rf ${out}/lib ${out}/include

{% block strip_bin %}
if command -v which; then
    if which llvm-strip; then
        find ${out}/bin/ | while read l; do
            if test -f ${l}; then
                llvm-strip ${l} || true
            fi
        done
    fi
fi
{% endblock %}
{% endif %}

log_rm() {
    echo "RM ${1}"
    rm "${1}"
}

if command -v find; then
{% if kind != 'lib' %}
    find ${out}/ | grep '\.[ao]$' | while read l; do
        log_rm ${l}
    done
{% endif %}

    find ${out}/ | grep '\.pc$' | while read l; do
        if grep '/bin' ${l}; then
{% if kind == 'bin' %}
            echo "STAY ${l}"; else log_rm ${l}
{% else %}
            log_rm ${l}; else echo "STAY ${l}"
{% endif %}
        fi
    done
fi

if test -d ${out}/man; then
    mkdir -p ${out}/share
    mv ${out}/man ${out}/share/
fi

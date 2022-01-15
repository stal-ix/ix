{%   if aux %}
rm -rf ${out}/bin ${out}/libexec ${out}/lib ${out}/include
{% elif lib %}
if test -f ${out}/bin/*-config; then
    mkdir -p ${out}/lib/bin && mv ${out}/bin/*-config ${out}/lib/bin/
fi

rm -rf ${out}/bin ${out}/libexec
{% elif bin %}
rm -rf ${out}/lib ${out}/include

{% block strip_bin %}
if command -v which; then
    if which llvm-strip; then
        find ${out}/bin/ | while read l; do
            if test -f ${l}; then
                if test -h ${l}; then
                    echo "skip symlink ${l}"
                else
                    llvm-strip -S ${l} || true
                fi
            fi
        done
    fi
fi
{% endblock %}
{% endif %}

warn_rm() {
    echo "BAD PKG ${1}, add strip_pc block if OK, or remove manually"
    exit 1
}

if command -v find; then
{% if not lib %}
    find ${out}/ | grep '\.[ao]$' | while read l; do
        rm ${l}
    done
{% endif %}

{% block strip_pc %}
    find ${out}/ | grep '\.pc$' | while read l; do
        if grep '/bin' ${l}; then
{% if bin %}
            echo "STAY ${l}"; else warn_rm ${l}
{% else %}
            warn_rm ${l}; else echo "STAY ${l}"
{% endif %}
        fi
    done
{% endblock %}
fi

if test -d ${out}/man; then
    mkdir -p ${out}/share
    mv ${out}/man ${out}/share/
fi

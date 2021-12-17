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

{% if kind != 'lib' %}
if command -v find; then
    find ${out}/ | grep '\.[ao]$' | while read l; do
        rm ${l}
    done
fi
{% endif %}

if test -d ${out}/man; then
    mkdir -p ${out}/share
    mv ${out}/man ${out}/share/
fi

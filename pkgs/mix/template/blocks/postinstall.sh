{%   if kind == 'dat' %}
rm -rf ${out}/bin ${out}/libexec ${out}/lib ${out}/include
{% elif kind == 'lib' %}
rm -rf ${out}/bin ${out}/libexec
{% elif kind == 'bin' %}
rm -rf ${out}/lib ${out}/include

{% block strip_bin %}
if which llvm-strip; then
    find ${out}/bin/ | while read l; do
        if test -f ${l}; then
            llvm-strip ${l} || true
        fi
    done
fi
{% endblock %}
{% endif %}

{% if kind != 'lib' %}
find ${out}/ | grep '\.[ao]$' | while read l; do
    rm ${l}
done
{% endif %}

if test -d ${out}/man; then
    mkdir -p ${out}/share
    mv ${out}/man ${out}/share/
fi

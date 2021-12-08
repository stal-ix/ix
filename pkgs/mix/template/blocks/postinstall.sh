{%   if kind == 'dat' %}
rm -rf ${out}/bin ${out}/libexec ${out}/lib ${out}/include
{% elif kind == 'lib' %}
rm -rf ${out}/bin ${out}/libexec
{% elif kind == 'bin' %}
rm -rf ${out}/lib ${out}/include
{% endif %}

if test -d ${out}/man; then
    mkdir -p ${out}/share
    mv ${out}/man ${out}/share/
fi

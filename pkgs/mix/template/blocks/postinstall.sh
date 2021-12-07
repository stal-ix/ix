{% if lib %}
rm -rf ${out}/bin
{% else %}
rm -rf ${out}/lib ${out}/include
{% endif %}

if test -d ${out}/man; then
    mkdir -p ${out}/share
    mv ${out}/man ${out}/share/
fi

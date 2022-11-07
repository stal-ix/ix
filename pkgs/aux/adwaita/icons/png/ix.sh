{% extends '//die/proxy.sh' %}

{% block bld_data %}
aux/adwaita/icons
{% endblock %}

{% block bld_tool %}
bin/inkscape
{% endblock %}

{% block build %}
fr=${aux_adwaita_icons}/share/icons/default/scalable
export HOME=${TMPDIR}
(cd ${fr}; find . -type f -name '*.svg') | while read l; do
    for n in 16 24 32 48; do
        p=${n}x${n}/${l}
        p=$(echo ${p} | sed -e 's|.svg|.png|')
        mkdir -p ${out}/share/icons/default/$(dirname ${p})
        echo ${out}/share/icons/default/${p}
        inkscape -o ${out}/share/icons/default/${p} -w ${n} ${fr}/${l}
    done
done
{% endblock %}

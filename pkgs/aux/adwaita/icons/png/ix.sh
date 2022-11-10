{% extends '//die/proxy.sh' %}

{% block bld_data %}
aux/adwaita/icons/scalable
{% endblock %}

{% block bld_tool %}
bld/inkscape
{% endblock %}

{% block build %}
fr=${ADWAITA_ICONS}/scalable
export HOME=${TMPDIR}
(cd ${fr}; find . -type f -name '*.svg') | while read l; do
    for n in 16 24 32 48; do
        p=${n}x${n}/${l}
        p=$(echo ${p} | sed -e 's|.svg|.png|')

        mkdir -p ${out}/share/icons/Adwaita/$(dirname ${p})

cat << EOF
file-open:${fr}/${l}
export-type:png
export-filename:${out}/share/icons/Adwaita/${p}
export-width:${n}
export-do
EOF
    done
done | inkscape --shell

mkdir ${out}/fix

cat << EOF > ${out}/fix/set-adwaita-by-default.sh
cd share/icons
rm -f default
ln -s Adwaita default
EOF
{% endblock %}

{% extends '//die/gen.sh' %}

{% block fix_deps %}
["bld/iconker", "bld/gtk/4"]
{% endblock %}

{% block install %}
mkdir -p ${out}/fix
cat << EOF > ${out}/fix/compile_icons.sh
ls share/icons/ | while read l; do
    iconker share/icons/\${l}/scalable share/icons/\${l}
    gtk4-update-icon-cache share/icons/\${l}
done
rm -f *.png
EOF
{% endblock %}

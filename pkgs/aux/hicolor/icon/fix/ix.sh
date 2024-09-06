{% extends '//die/proxy.sh' %}

{% block fix_deps %}
["bld/iconker"]
{% endblock %}

{% block install %}
mkdir -p ${out}/fix
cat << EOF > ${out}/fix/compile_icons.sh
ls share/icons/ | while read l; do
    iconker share/icons/\${l}/scalable share/icons/\${l}
done
rm *.png
EOF
{% endblock %}

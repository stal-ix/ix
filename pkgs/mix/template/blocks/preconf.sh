mkdir ${tmp}/tools && cd ${tmp}/tools

export PATH="${PWD}:${PATH}"

cat << EOF > which
#!$(command -v dash)
command -v "\$@"
EOF

chmod +x which

for x in ps strip; do
    cat << EOF > ${x}
#!$(which dash)
EOF

    chmod +x ${x}
done

cat << EOF > arch
#!$(which dash)
echo '{{target.arch}}'
EOF

chmod +x arch

cat << EOF > hostname
#!$(which dash)
echo localhost
EOF

chmod +x hostname

{% if target.os == 'darwin' %}
cat << EOF > sw_vers
#!$(which dash)
echo ${MACOSX_DEPLOYMENT_TARGET}
EOF

chmod +x sw_vers
{% endif %}

ln -s $(which dash) sh

{% block setup_compiler %}
setup_toolchain
{% endblock %}

{% block setup_tools %}
{% endblock %}

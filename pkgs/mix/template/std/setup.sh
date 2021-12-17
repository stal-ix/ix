export bld=${PWD}

mkpushd ${tmp}/tools

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
done

cat << EOF > arch
#!$(which dash)
echo '{{target.arch}}'
EOF

cat << EOF > hostname
#!$(which dash)
echo localhost
EOF

chmod +x arch ps strip hostname

{% if target.os == 'darwin' %}
cat << EOF > sw_vers
#!$(which dash)
echo ${MACOSX_DEPLOYMENT_TARGET}
EOF

chmod +x sw_vers
{% endif %}

ln -s $(which dash) sh

pushcwd
{% block setup_compiler %}
{% endblock %}
popd

pushcwd
{% block setup_tools %}
{% endblock %}
popd

popd

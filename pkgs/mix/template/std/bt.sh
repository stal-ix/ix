cat << EOF > which
#!$(command -v sh)
command -v "\$@"
EOF

chmod +x which

for x in ps strip; do
    cat << EOF > ${x}
#!$(which sh)
EOF
done

cat << EOF > arch
#!$(which sh)
echo '{{target.arch}}'
EOF

cat << EOF > hostname
#!$(which sh)
echo localhost
EOF

chmod +x arch ps strip hostname

{% if target.os == 'darwin' %}
cat << EOF > sw_vers
#!$(which sh)
echo ${MACOSX_DEPLOYMENT_TARGET}
EOF

chmod +x sw_vers
{% endif %}

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
echo '{{mix.platform.target.arch}}'
EOF

chmod +x arch

cat << EOF > hostname
#!$(which dash)
echo localhost
EOF

chmod +x hostname

ln -s $(which dash) sh

setup_toolchain

{% block toolconf %}
{% endblock %}

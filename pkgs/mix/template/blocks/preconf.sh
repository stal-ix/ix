cur_dir=${PWD}

mkdir ${tmp}/tools && cd ${tmp}/tools

export PATH="${PWD}:${PATH}"

for x in ps strip; do
    cat << EOF > ${x}
#!$(command -v dash)
EOF

    chmod +x ${x}
done

cat << EOF > arch
#!$(command -v dash)
echo '{{mix.platform.target.arch}}'
EOF

chmod +x arch

cat << EOF > hostname
#!$(command -v dash)
echo localhost
EOF

chmod +x hostname

ln -s $(command -v dash) sh

setup_toolchain

{% block toolconf %}
{% endblock %}

cd ${cur_dir}

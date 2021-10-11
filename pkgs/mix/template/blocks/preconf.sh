cur_dir=${PWD}

mkdir ${tmp}/tools && cd ${tmp}/tools

export PATH="${PWD}:${PATH}"

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

setup_compiler

{{toolconf}}

cd ${cur_dir}

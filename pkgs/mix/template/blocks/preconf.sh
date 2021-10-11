cur_dir=${PWD}

mkdir ${tmp}/tools && cd ${tmp}/tools

export PATH="${PWD}:${PATH}"

cat << EOF > strip
#!$(which dash)
EOF

chmod +x strip

cat << EOF > arch
#!$(which dash)
echo '{{mix.platform.target.arch}}'
EOF

chmod +x arch

ln -s $(which dash) sh

setup_compiler

{% block toolconf %}
{% endblock %}

cd ${cur_dir}

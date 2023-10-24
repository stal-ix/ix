{% extends '//bin/gdb/reloc/ix.sh' %}

{% block gdb_args %}--eval-command="source \${p2}/share/gdb/python/arc/__init__.py"{% endblock %}

{% block install %}
{{super()}}
sed -e 's|/usr/bin/env bash|/bin/bash|' -i ${out}/bin/gcore
cd ${out}/share/gdb/python
mkdir arc
cd arc
bsdtar -x -f {{arcadia_pretty_printers}} --strip-components 1
mkdir ${out}/fix
cat << EOF > ${out}/fix/mksymlink.sh
mkdir gdb
mv bin lib share gdb/
EOF
{% endblock %}

{% extends '//bin/gdb/reloc/ix.sh' %}

{% block install %}
{{super()}}
mkdir ${out}/fix
cat << EOF > ${out}/fix/mksymlink.sh
mkdir gdb
mv bin lib share gdb/
EOF
{% endblock %}

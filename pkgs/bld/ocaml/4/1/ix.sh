{% extends '//bld/ocaml/4/t/ix.sh' %}

{% block bld_tool %}
bld/ocaml/boot
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
cp $(which ocamlc) boot/
cp $(which ocamllex) boot/
cat << EOF > boot/ocamlrun
#!/usr/bin/env sh
$(which ocamlrun) "\${@}" || "\${@}"
EOF
chmod +x boot/ocamlrun
sed -e 's|cp byterun/ocamlrun.*|echo 1|' -i Makefile
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cat ocamlc | tail -n +2 > ${out}/bin/ocamlc.byte
cat lex/ocamllex | tail -n +2 > ${out}/bin/ocamllex.byte
chmod +x ${out}/bin/*
{% endblock %}

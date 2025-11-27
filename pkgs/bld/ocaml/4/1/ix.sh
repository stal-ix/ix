{% extends '//bld/ocaml/4/t/ix.sh' %}

{% block patch %}
{{super()}}
cat << EOF > boot/ocamlrun
#!/usr/bin/env sh
$(which ocamlrun) "\${@}" || "\${@}"
EOF
chmod +x boot/ocamlrun
sed -e 's|cp byterun/ocamlrun.*|echo 1|' -i Makefile
sed -e 's|$(MAKE.*ocamltest.*|echo 1|' -i Makefile
sed -e 's|$(MAKE.*otherlibrariesopt.*|echo 1|' -i Makefile
sed -e 's|$(MAKE.*ocamldoc.*|echo 1|' -i Makefile
{% endblock %}

{% block install %}
mkdir ${out}/bin/
cat ocamlc | tail -n +2 > ${out}/bin/ocamlc
chmod +x ${out}/bin/ocamlc
{% endblock %}

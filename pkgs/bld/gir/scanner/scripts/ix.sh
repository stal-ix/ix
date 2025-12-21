{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin

cat << EOF > ${out}/bin/gircc
#!/usr/bin/env sh
exec girlink \${REALCC} -U__OPTIMIZE__ -L/PLUGIN:\$(which plg_rdynamic) "\${@}"
EOF

cat << EOF > ${out}/bin/g-ir-scanner
#!/usr/bin/env sh
export REALCC=\${HOST_CC}
export SELF=\${HOST_CC}
export CC=gircc
export GI_SCANNER_DISABLE_CACHE=1
exec g-ir-scanner-bin \${GIRSFLAGS} "\${@}"
EOF

cat << EOF > ${out}/bin/g-ir-compiler
#!/usr/bin/env sh
exec g-ir-compiler-bin \${GIRCFLAGS} "\${@}"
EOF

base64 -d << EOF > ${out}/bin/girlink
{% include 'girlink.py/base64' %}
EOF

chmod +x ${out}/bin/*
{% endblock %}

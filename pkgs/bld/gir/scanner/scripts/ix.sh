{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin

cat << EOF > ${out}/bin/gircc
#!/usr/bin/env sh
exec girlink \${REALCC} -U__OPTIMIZE__ "\${@}"
EOF

cat << EOF > ${out}/bin/g-ir-scanner
#!/usr/bin/env sh
export REALCC=\${CC}
export CC=gircc
export GI_SCANNER_DISABLE_CACHE=1
exec g-ir-scanner-bin "\${@}"
EOF

base64 -d << EOF > ${out}/bin/girlink
{% include 'girlink.py/base64' %}
EOF

chmod +x ${out}/bin/*
{% endblock %}

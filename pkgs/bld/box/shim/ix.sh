{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

cat << EOF > which
#!/usr/bin/env sh
command -v "\$@"
EOF

chmod +x which

export PATH=${PWD}:${PATH}

for x in ps strip ldconfig; do
cat << EOF > ${x}
#!/usr/bin/env sh
EOF
done

cat << EOF > arch
#!/usr/bin/env sh
echo '{{target.arch}}'
EOF

cat << EOF > hostname
#!/usr/bin/env sh
echo localhost
EOF

cat << EOF > sw_vers
#!/usr/bin/env sh
echo "ProductName:		macOS"
echo "ProductVersion:		\${MACOSX_DEPLOYMENT_TARGET}"
echo "BuildVersion:		DEADBEEF"
EOF

chmod +x *
{% endblock %}

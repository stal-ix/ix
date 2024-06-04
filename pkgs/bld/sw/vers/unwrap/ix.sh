{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/sw_vers
#!/usr/bin/env sh
echo "ProductName:		macOS"
echo "ProductVersion:		\${MACOSX_DEPLOYMENT_TARGET}"
echo "BuildVersion:		DEADBEEF"
EOF
chmod +x ${out}/bin/*
{% endblock %}

{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/bin

cat << EOF > ${out}/bin/claude
#!/usr/bin/env sh
exec wrap claude.exe -- "\$@"
EOF

chmod +x ${out}/bin/claude
{% endblock %}

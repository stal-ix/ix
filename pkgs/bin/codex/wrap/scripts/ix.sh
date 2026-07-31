{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/bin

cat << EOF > ${out}/bin/codex
#!/usr/bin/env sh
exec wrap codex.exe -- "\$@"
EOF

chmod +x ${out}/bin/codex
{% endblock %}

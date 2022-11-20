{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/fix; cd ${out}/fix

cat << EOF > wrap-sudo-{{wrap}}.sh
#!/usr/bin/env sh
mv bin/{{wrap}} bin/{{wrap}}-bin
mv fix/{{wrap}}.tmp bin/{{wrap}}
EOF

cat << EOF > {{wrap}}.tmp
#!/usr/bin/env sh
exec sudo \$(which {{wrap}}-bin) "\${@}"
EOF

chmod +x wrap-sudo-{{wrap}}.sh {{wrap}}.tmp
{% endblock %}

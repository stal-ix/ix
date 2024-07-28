{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin

cat << EOF > ${out}/bin/cppgir
#!/usr/bin/env sh
exec cppgir-bin --gir-path \${GIRPATH} "\${@}"
EOF

chmod +x ${out}/bin/*
{% endblock %}

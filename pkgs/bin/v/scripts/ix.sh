{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > v
#!/usr/bin/env sh
chroma -f terminal16m -s lovelace "\${@}" | gnuless -N -R
EOF

chmod +x v
{% endblock %}

{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/plg_unreg
#!/usr/bin/env python3
P = '{{bins}}'
EOF
base64 -d << EOF >> ${out}/bin/plg_unreg
{% include 'unreg.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}

{% block env %}
export LDFLAGS="-L/PLUGIN:${out}/bin/plg_unreg \${LDFLAGS}"
{% endblock %}

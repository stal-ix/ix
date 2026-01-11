{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF >> ${out}/bin/plg_logcmd
{% include 'logcmd.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}

{% block env %}
export LDFLAGS="-L/PLUGIN:${out}/bin/plg_logcmd \${LDFLAGS}"
{% endblock %}

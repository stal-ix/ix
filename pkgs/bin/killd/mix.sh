{% extends '//mix/template/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p etc/services/killd; cd etc/services/killd;

base64 -d << EOF > run
{% include 'cycle.sh/base64' %}
EOF

chmod +x run
{% endblock %}

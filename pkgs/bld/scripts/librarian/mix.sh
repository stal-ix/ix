{% extends '//mix/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > patchns
{% include 'patchns.sh/base64' %}
EOF

chmod +x *
{% endblock %}

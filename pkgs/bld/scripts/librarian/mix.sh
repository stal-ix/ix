{% extends '//mix/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > patchns
{% include 'patchns.sh/base64' %}
EOF

base64 -d << EOF > fixallns
{% include 'fixallns.sh/base64' %}
EOF

chmod +x *
{% endblock %}

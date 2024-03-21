{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > srv
{% include 'srv/base64' %}
EOF

base64 -d << EOF > srv2
{% include 'srv2/base64' %}
EOF

base64 -d << EOF > logged
{% include 'logged/base64' %}
EOF

base64 -d << EOF > logged2
{% include 'logged2/base64' %}
EOF

chmod +x *
{% endblock %}

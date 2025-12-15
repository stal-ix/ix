{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > exelink
#!/usr/bin/env python3
P = '{{bins}}'
EOF

base64 -d << EOF >> exelink
{% include 'exelink.py/base64' %}
EOF

chmod +x *
{% endblock %}

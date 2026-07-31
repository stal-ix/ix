{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/bin

cat << EOF > ${out}/bin/wrap
#!/usr/bin/env python3
EOF
base64 -d << EOF >> ${out}/bin/wrap
{% include 'wrap.py/base64' %}
EOF

chmod +x ${out}/bin/wrap
{% endblock %}

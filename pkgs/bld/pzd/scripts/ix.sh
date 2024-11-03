{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/ser
{% include 'ser/base64' %}
EOF

base64 -d << EOF > ${out}/bin/ser_py
{% include 'ser.py/base64' %}
EOF

base64 -d << EOF > ${out}/bin/des
{% include 'des/base64' %}
EOF

base64 -d << EOF > ${out}/bin/des_py
{% include 'des.py/base64' %}
EOF

base64 -d << EOF > ${out}/bin/stable_pack_v3
{% include 'stable_pack_3/base64' %}
EOF

chmod +x ${out}/bin/*
{% endblock %}

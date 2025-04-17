{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/ix_upver
{% include 'fix/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_flt
{% include 'flt/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_up
{% include 'up/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}

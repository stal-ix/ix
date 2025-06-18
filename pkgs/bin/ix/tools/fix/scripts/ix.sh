{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/ix_fix
{% include 'ix_fix.sh/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_flt
{% include 'ix_flt.py/base64' %}
EOF
base64 -d << EOF > ${out}/bin/ix_up
{% include 'ix_up.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}

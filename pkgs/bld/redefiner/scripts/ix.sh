{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/ix_redefiner
{% include 'ix_redefiner.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}

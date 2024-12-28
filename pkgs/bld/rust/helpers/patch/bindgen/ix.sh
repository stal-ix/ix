{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/patch_bindgen
{% include 'patch.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}

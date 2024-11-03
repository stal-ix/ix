{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/pkg-config
{% include 'pkgconf.py/base64' %}
EOF

chmod +x ${out}/bin/pkg-config
{% endblock %}

{% block env %}
export PKG_CONFIG="${out}/bin/pkg-config"
{% endblock %}

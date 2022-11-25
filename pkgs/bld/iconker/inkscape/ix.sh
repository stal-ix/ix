{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/sh
bld/python
bld/inkscape
{% endblock %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > iconker.py
{% include 'iconker.py/base64' %}
EOF

base64 -d << EOF > iconker
{% include 'iconker.sh/base64' %}
EOF

chmod +x *
{% endblock %}

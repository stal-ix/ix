{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/python
bin/svg2png
bin/convert
{% endblock %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > iconker
{% include 'iconker.py/base64' %}
EOF

chmod +x *
{% endblock %}

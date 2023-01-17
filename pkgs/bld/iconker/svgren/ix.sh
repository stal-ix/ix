{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/python
bin/convert
bin/svgren/tool(render_w=192,render_h=192)
{% endblock %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > iconker
{% include 'iconker.py/base64' %}
EOF

chmod +x *
{% endblock %}

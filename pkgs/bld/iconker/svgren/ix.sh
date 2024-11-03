{% extends '//die/gen.sh' %}

{% block run_deps %}
bin/svgren/tool(render_w=192,render_h=192)
{% endblock %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > render_icon
{% include 'render.sh/base64' %}
EOF

chmod +x *
{% endblock %}

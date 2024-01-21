{% extends '//die/proxy.sh' %}

{% block run_deps %}
bin/svg2png
{% endblock %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > render_icon
{% include 'render.sh/base64' %}
EOF

chmod +x *
{% endblock %}

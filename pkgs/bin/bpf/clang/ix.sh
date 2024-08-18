{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > bpf_clang
{% include 'bpf_clang.sh/base64' %}
EOF

chmod +x *
{% endblock %}

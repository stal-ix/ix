{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > clang
{% include 'clang.sh/base64' %}
EOF

cp clang clang++

chmod +x *
{% endblock %}

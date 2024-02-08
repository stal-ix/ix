{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > fix_cmake_lib
{% include 'fix.sh/base64' %}
EOF

chmod +x *
{% endblock %}

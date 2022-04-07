{% extends '//mix/proxy.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

base64 -d << EOF > dl_stubs
{% include 'dl_stubs.py/base64' %}
EOF

chmod +x *
{% endblock %}

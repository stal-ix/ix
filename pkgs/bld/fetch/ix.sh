{% extends '//die/proxy.sh' %}

{% block run_deps %}
bin/wget
bin/curl
bld/python
{% endblock %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/fetch
{% include 'fetch.py/base64' %}
EOF
chmod +x ${out}/bin/fetch
{% endblock %}

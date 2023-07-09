{% extends '//die/proxy.sh' %}

{% block run_deps %}
bin/lz4
bld/tar
{% endblock %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/stable_unpack
{% include 'stable_unpack/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}

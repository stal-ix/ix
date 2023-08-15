{% extends '//die/proxy.sh' %}

{% block run_deps %}
bin/lz4
bin/tar
bld/r/o
{% endblock %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/stable_pack
{% include 'stable_pack/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}

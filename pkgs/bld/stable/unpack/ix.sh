{% extends '//die/proxy.sh' %}

{% block run_deps %}
bin/lz4
bld/tar
bld/r/w
{% endblock %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/stable_unpack
{% include 'stable_unpack/base64' %}
EOF

base64 -d << EOF > ${out}/bin/stable_unpack_2
{% include 'stable_unpack_2/base64' %}
EOF

base64 -d << EOF > ${out}/bin/restore_links
{% include 'restore_links/base64' %}
EOF

chmod +x ${out}/bin/*
{% endblock %}

{% extends '//die/proxy.sh' %}

{% block run_deps %}
bin/lz4
bin/tar
bld/r/o
bld/stable/serdes
{% endblock %}

{% block install %}
mkdir ${out}/bin

base64 -d << EOF > ${out}/bin/stable_pack_v1
{% include 'stable_pack/base64' %}
EOF

base64 -d << EOF > ${out}/bin/store_links
{% include 'store_links/base64' %}
EOF

base64 -d << EOF > ${out}/bin/stable_pack_v2
{% include 'stable_pack_2/base64' %}
EOF

base64 -d << EOF > ${out}/bin/stable_pack_v3
{% include 'stable_pack_3/base64' %}
EOF

chmod +x ${out}/bin/*
{% endblock %}

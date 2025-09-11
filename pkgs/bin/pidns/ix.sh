{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/pidns
{% include 'pidns.sh/base64' %}
EOF
base64 -d << EOF > ${out}/bin/pidns_chroot
{% include 'pidns_chroot.sh/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}

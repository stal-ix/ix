{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/timeout
#!/bin/sh
exec subreaper busybox timeout "\${@}"
EOF
chmod +x ${out}/bin/*
{% endblock %}

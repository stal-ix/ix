{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/setcwd
#!/bin/sh
cd "\${1}"
shift
exec "\${@}"
EOF
chmod +x ${out}/bin/*
{% endblock %}

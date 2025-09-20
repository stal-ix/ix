{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/bin
cat << EOF > ${out}/bin/initrd
#!/bin/sh
export PATH=/bin
echo XXXXXXXXXXXX
exec /bin/sh
EOF
chmod +x ${out}/bin/initrd
{% endblock %}

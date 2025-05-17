{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}
mkdir bin
cd bin
cat << EOF > rc
#!/bin/sh
export PATH=/bin
if /etc/runit/1; then
    exec /etc/runit/2
else
    exec /etc/runit/3
fi
EOF
chmod +x *
{% endblock %}

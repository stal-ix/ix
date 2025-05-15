{% extends '//die/gen.sh' %}

{% block install %}
cd ${out}
mkdir bin
cd bin
cat << EOF > rc
#!/bin/sh
export PATH=/bin
/etc/runit/1
exec /etc/runit/2
EOF
chmod +x *
{% endblock %}

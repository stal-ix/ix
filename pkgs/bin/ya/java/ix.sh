{% extends '//die/gen.sh' %}

{% block install %}
mkdir ${out}/bin
base64 -d << EOF > ${out}/bin/java
{% include 'java.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}

{% block env %}
export YA_JAVA_DIR=${out}
{% endblock %}

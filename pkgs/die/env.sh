{% extends 'script.json' %}

{% block script_body %}
sed -xue
export PATH=/ix/realm/boot/bin:/bin:/usr/bin:/usr/local/bin
rm -rf ${out}
mkdir ${out}
cat << EOF > ${out}/env
export PATH=${out}/bin:\${PATH}
EOF
base64 -d << EOF >> ${out}/env
{{self.env() | b64e}}
EOF
{% endblock %}

{% block script_exec %}
["/bin/sh", "-s"]
{% endblock %}

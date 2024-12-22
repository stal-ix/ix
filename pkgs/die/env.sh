{% extends 'script.json' %}

{% block script_body %}
set -xue
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
["/usr/bin/env", "PATH={{ix_boot_path}}", "sh", "-s"]
{% endblock %}

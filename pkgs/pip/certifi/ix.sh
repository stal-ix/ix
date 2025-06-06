{% extends '//pip/certifi/t/ix.sh' %}

{% block install %}
{{super()}}
cat << EOF > ${out}/lib/certifi/core.py
import os
import base64

WHERE = [
    "/etc/ssl/certs/ca-certificates.crt",
    "/etc/pki/tls/certs/ca-bundle.crt",
    "/etc/ssl/ca-bundle.pem",
    "/etc/pki/tls/cacert.pem",
    "/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem",
    "/etc/ssl/cert.pem",
]

BUILTIN = '''
EOF

cat ${out}/lib/certifi/cacert.pem | base64 >> ${out}/lib/certifi/core.py

cat << EOF >> ${out}/lib/certifi/core.py
'''.strip()

def where():
    for x in WHERE:
        if os.path.isfile(x):
            return x

    return 'cacert.pem'

def contents():
    try:
        with open(where(), 'r') as f:
            return f.read()
    except Exception as e:
        return base64.b64decode(BUILTIN).decode()
EOF

rm ${out}/lib/certifi/cacert.pem
{% endblock %}

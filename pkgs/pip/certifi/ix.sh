{% extends '//pip/certifi/t/ix.sh' %}

{% block install %}
{{super()}}
cat << EOF > ${out}/lib/certifi/core.py
def where():
    return '/ix/realm/system/share/ssl.cert.pem'

def contents():
    with open(where(), 'r') as f:
        return f.read()
EOF
rm ${out}/lib/certifi/cacert.pem
{% endblock %}

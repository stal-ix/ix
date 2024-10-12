{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/fetcher
#!/usr/bin/env python3
M = '''
{% include '//die/scripts/mirrors.txt' %}
'''
EOF
base64 -d << EOF >> ${out}/bin/fetcher
{% include 'fetcher.py/base64' %}
EOF
chmod +x ${out}/bin/*
{% endblock %}

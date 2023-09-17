{% extends '//die/proxy.sh' %}

{% set mirrors %}
{% include '//die/scripts/mirrors.txt' %}
{% endset %}

{% set args %}
--no-conf=true
--out=\${1}
--async-dns=false
--uri-selector=inorder
--check-certificate=false
--checksum=sha-256=\${2}
--console-log-level=notice
\${3}
{% for m in mirrors.strip().split() %}
{{m}}/\${2}
{% endfor %}
{% endset %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/fetch_cached
#!/usr/bin/env sh
set -xue
aria2c {{ix.fix_list(args)}}
EOF
chmod +x ${out}/bin/fetch_cached
{% endblock %}

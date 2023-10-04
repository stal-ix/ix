{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > fetch_ix_mirror
#!/usr/bin/env sh
set -xue
mkdir -p {{wd}}
cd {{wd}}
mkdir -p data
rm -rf ix
git clone https://github.com/pg83/ix
cd ix
./ix recache {{wd}}/data || true
sleep 3600
EOF

chmod +x *
{% endblock %}

{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << EOF > ci_cycle
#!/usr/bin/env sh
set -xue
mkdir -p {{wd}}
cd {{wd}}
(cd ix; git pull) || (rm -rf ix; git clone https://github.com/pg83/ix)
cd ix
./ix mut ci set/ci bld/all || true
sleep 200
EOF

chmod +x *
{% endblock %}

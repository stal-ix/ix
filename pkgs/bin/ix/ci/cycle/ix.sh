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
export IX_ROOT={{wd}}/ix_root
export IX_EXEC_KIND=local
./ix build set/ci bld/all || true
sleep 200
EOF

chmod +x *
{% endblock %}

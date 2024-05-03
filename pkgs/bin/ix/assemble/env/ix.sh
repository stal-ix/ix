{% extends '//die/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/env.d

cat << EOF > ${out}/etc/env.d/ix_root.sh
export IX_ROOT=/ix
EOF

cat << EOF > ${out}/etc/env.d/ix_exec_kind.sh
export IX_EXEC_KIND=system
EOF
{% endblock %}

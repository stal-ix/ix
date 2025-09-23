{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/etc/profile.d

cat << EOF > ${out}/etc/profile.d/ix_root.sh
export IX_ROOT=/ix
EOF

cat << EOF > ${out}/etc/profile.d/ix_exec_kind.sh
export IX_EXEC_KIND=system
EOF
{% endblock %}

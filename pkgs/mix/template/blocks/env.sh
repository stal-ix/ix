cat << EOF > ${out}/env
{{env}}
EOF

(
    set -eu


) >> ${out}/env

mkdir -p etc

cat << EOF > etc/grub.cfg
probe --part-uuid \$root --set=rootuuid
EOF

ls bin/kernel-* | sort -r | while read l; do
    cat << EOF >> etc/grub.cfg
menuentry "${l}" {
    linux /${l} ro root=PARTUUID=\$rootuuid
    boot
}
EOF
done

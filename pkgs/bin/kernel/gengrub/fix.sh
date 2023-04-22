mkdir -p etc

cat << EOF > etc/grub.cfg
probe -u \$root --set=rootuuid
EOF

ls bin/kernel-* | while read l; do
    cat << EOF >> etc/grub.conf
menuentry "${l}" {
    linux /${l} ro root=UUID=\$rootuuid
    boot
}
EOF
done

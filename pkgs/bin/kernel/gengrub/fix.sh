mkdir -p etc

cat << EOF > etc/grub.cfg
insmod all_video
timeout=5
probe --part-uuid \$root --set=rootuuid
EOF

ls bin/kernel-* | sort -r | while read l; do
    cat << EOF >> etc/grub.cfg
menuentry "${l}" {
    linux /${l} ro root=PARTUUID=\$rootuuid quiet=1
    boot
}
EOF
done

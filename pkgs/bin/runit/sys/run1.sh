cd etc/runit

cat - $(ls 1.d/*) << EOF > 1
#!/bin/sh
EOF

rm -r 1.d

chmod +x 1

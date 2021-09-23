set -x

adduser -h /mix -S -D mix

apk add python3

export REALM="/mix/realm/stable"
export PATH="${REALM}/bin:/mix/bootstrap/venv/bin:${PATH}"

su mix -s /bin/sh << EOF
set -e
set -x

cd /mix && mkdir bootstrap && cd bootstrap

python3 -m venv venv
python3 -m pip install jinja2

python3 /bootstrap/mix realm add stable \
    mix/mix \
        -Dmix_ver=856161cdb1b867bf65c1bdc776dee9a13065bcf6 \
        -Dmix_md5=0a87df966ee4066ffa43046793147332 \
    sys/linux/busybox

mix realm upgrade
mix realm upgrade
mix gc
EOF

rm -rf /bootstrap \
    /mix/bootstrap /mix/cache     \
    /bin /lib /mnt /run /srv /tmp \
    /var /home /media /opt /root  \
    /sbin /usr

ln -s "${REALM}/bin" /bin

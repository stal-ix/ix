set -e
set -x

. /run/secrets/aws

adduser -h /mix -S -D mix

apk add python3 dash

export REALM="/mix/realm/stable"
export PATH="${REALM}/bin:/mix/bootstrap/venv/bin:${PATH}"

su mix -s $(which dash) << EOF
set -e
set -x

cd /mix && mkdir bootstrap && cd bootstrap

python3 -m venv venv
python3 -m pip install jinja2 beautysh minio

python3 /bootstrap/mix realm add stable mix/mix \
    -Dmix_ver=1b0950c1e83acca5226940f7a2d07cfbbce1b9ae \
    -Dmix_md5=4c014d899d19b2245a4f0e2fe0de0f91

mix realm upgrade
mix realm upgrade

mix realm add stable sys/linux/busybox

mix gc
EOF

rm -rf /bootstrap \
    /mix/bootstrap /mix/.cache   \
    /bin /lib /mnt /srv /tmp     \
    /var /home /media /opt /root \
    /sbin /usr

ln -s "${REALM}/bin" /bin

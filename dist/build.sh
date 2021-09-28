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
python3 -m pip install jinja2 beautysh boto3

python3 /bootstrap/mix realm add stable \
    mix/mix \
        -Dmix_ver=5440dee479af8014d3e06103b8fc891302ca52e2 \
        -Dmix_md5=3cea2284ba8ecc21c17183d528b88b26 \
    sys/linux/busybox

mix realm upgrade
mix realm upgrade
mix gc
EOF

rm -rf /bootstrap \
    /mix/bootstrap /mix/.cache   \
    /bin /lib /mnt /srv /tmp     \
    /var /home /media /opt /root \
    /sbin /usr

ln -s "${REALM}/bin" /bin

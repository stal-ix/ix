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
        -Dmix_ver=6c9a24864c2d68b9fde6368e2478abef5c6fa03f \
        -Dmix_md5=27ab4a7cc5ae22aa18e8f3c3935576 \
    sys/linux/busybox

mix realm upgrade
mix realm upgrade
mix gc
EOF

rm -rf /bootstrap \
    /mix/bootstrap /mix/.cache    \
    /bin /lib /mnt /run /srv /tmp \
    /var /home /media /opt /root  \
    /sbin /usr

ln -s "${REALM}/bin" /bin

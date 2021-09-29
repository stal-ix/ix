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

python3 /bootstrap/mix realm add stable mix/mix \
    -Dmix_ver=956f440dc889656bb33c7269b79dbef2b855f4e4 \
    -Dmix_md5=ba94917bff67c45b3c38412013404686

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

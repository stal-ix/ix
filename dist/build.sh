set -x

. /run/secrets/aws

cat << EOF > /etc/resolv.conf
nameserver 2001:4860:4860::6464
nameserver 2001:4860:4860::64
EOF

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
        -Dmix_ver=eadb02f6ac003734ce6501ee4c65252c26693fbf \
        -Dmix_md5=56cfe9dda89c45027bde1045a069d0c8 \
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

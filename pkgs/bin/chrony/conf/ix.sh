{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc

cat << EOF > ${out}/etc/chrony.conf
server 216.239.35.0 iburst
server 216.239.35.4 iburst
server 216.239.35.8 iburst
server 216.239.35.12 iburst
server 162.159.200.123 iburst
server 162.159.200.1 iburst
driftfile /var/run/chrony/drift
makestep 1.0 3
rtcsync
EOF
{% endblock %}

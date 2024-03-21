{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/etc

cat << EOF > ${out}/etc/chrony.conf
server time1.google.com iburst
server time2.google.com iburst
server time3.google.com iburst
server time4.google.com iburst
driftfile /var/run/chrony/drift
makestep 1.0 3
rtcsync
EOF
{% endblock %}

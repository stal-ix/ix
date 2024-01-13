{% extends '//die/go/pure.sh' %}

{% block version %}
46eeb733e9d0b7170ee7f1f8967bd3b3731ef8ff
{% endblock %}

{% block go_url %}
https://github.com/pg83/portal/archive/{{self.version().strip()}}.zip
{% endblock %}

{% block go_sha %}
93ddf644247a072056b55fe232dbaac316b77bf17a226733f1e839df16292118
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp portal ${out}/bin/xdg-portal-ix

mkdir -p ${out}/share/dbus-1/services

cat << EOF > ${out}/share/dbus-1/services/org.freedesktop.portal.Desktop.service
[D-BUS Service]
Name=org.freedesktop.portal.Desktop
Exec=${out}/bin/xdg-portal-ix
EOF
{% endblock %}

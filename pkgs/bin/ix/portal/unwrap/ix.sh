{% extends '//die/go/pure.sh' %}

{% block version %}
bc6ad5a3e104423efb47ddeed470d7d83fb8eb41
{% endblock %}

{% block go_url %}
https://github.com/pg83/portal/archive/{{self.version().strip()}}.zip
{% endblock %}

{% block go_sha %}
9a57525a85576a10fdc1218880995fef3dbfc14c40e9fb14e5eea58518028edc
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

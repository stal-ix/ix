{% extends '//die/go/pure.sh' %}

{% block version %}
6b4069b1d1ed82c4d8a4b64054bf7fa719ead62e
{% endblock %}

{% block go_url %}
https://github.com/pg83/portal/archive/{{self.version().strip()}}.zip
{% endblock %}

{% block go_sha %}
c2eeab5a587b2d8ea49df6b2941655c3ee04b6bbcd60259045f71352464a0d0a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp portal ${out}/bin/xdg-portal-ix

mkdir -p ${out}/share/dbus-1/services

cat << EOF > ${out}/share/dbus-1/services/org.freedesktop.portal.Desktop.service
[D-BUS Service]
Name=org.freedesktop.portal.Desktop
Exec=/bin/sh -c "exec xdg-portal-ix"
EOF
{% endblock %}

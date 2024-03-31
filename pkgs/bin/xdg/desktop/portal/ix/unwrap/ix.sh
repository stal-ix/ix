{% extends '//die/go/build.sh' %}

{% block version %}
6b4069b1d1ed82c4d8a4b64054bf7fa719ead62e
{% endblock %}

{% block go_url %}
https://github.com/pg83/portal/archive/{{self.version().strip()}}.zip
{% endblock %}

{% block go_sha %}
3a95f4d5d4758ef3610995522cb49c12b4a32a7399c3a7b80a635572e877a4cc
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

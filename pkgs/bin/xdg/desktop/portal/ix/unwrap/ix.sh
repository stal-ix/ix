{% extends '//die/go/build_v2.sh' %}

{% block version %}
6b4069b1d1ed82c4d8a4b64054bf7fa719ead62e
{% endblock %}

{% block go_url %}
https://github.com/pg83/portal/archive/{{self.version().strip()}}.zip
{% endblock %}

{% block go_sha %}
0850ce10b5ea73eaa7a9d2fb6aecb019bbe24d36ce836d9069be5ab6107ae070
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

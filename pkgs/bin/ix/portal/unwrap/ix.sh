{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/pg83/portal/archive/d6a289a9fddd6913fe7e2f348a102b6bed4b3c0f.zip
{% endblock %}

{% block go_sha %}
76b98a4311c2accb411d1ef79b389d8776778851a3dcdf2afa9c05de47613143
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

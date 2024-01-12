{% extends '//die/go/pure.sh' %}

{% block version %}
f70ebe9fb4e8276af52f93871cf4eccd1a524936
{% endblock %}

{% block go_url %}
https://github.com/pg83/portal/archive/{{self.version().strip()}}.zip
{% endblock %}

{% block go_sha %}
f11e7c754134564a1ed7299873231f5f1c334d0eacdcd68efde777382044f38b
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
